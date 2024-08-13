import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/command/commands.dart';
import 'package:ecommerce_web/domain/command/util/batch_command.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/admin_payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:equatable/equatable.dart';

part 'admin_order_event.dart';
part 'admin_order_state.dart';

class AdminOrderBloc extends Bloc<AdminOrderEvent, AdminOrderState> {
  final OrderRepositoryAbstraction orderRepository;
  final AdminOrderRepositoryAbstraction adminOrderRepository;
  final PaymentRepositoryAbstraction paymentRepository;
  final DeliveryRepositoryAbstraction deliveryRepository;
  late final StreamSubscription<CommandResult> orderCommandResults;

  AdminOrderBloc(
      {required this.adminOrderRepository,
      required this.paymentRepository,
      required this.deliveryRepository,
      required this.orderRepository})
      : super(const AdminOrderState()) {
    orderCommandResults = orderRepository.orderCommandResults.listen(
      onError: (e) => print(e),
      (commandResult) =>
          add(OrderCommandResultEvent(commandResult: commandResult)),
    );
    on<AdminOrderOnLoadEvent>((event, emit) async {
      final orders = await adminOrderRepository.getOrders();
      final paymentProviders =
          await paymentRepository.getPaymentServiceProviders();
      final deliveryProviders = await deliveryRepository.getDeliveryProviders();

      final mappedOrders = orders
          .map((order) => OrderWrapper(
              id: order.id,
              selected: false,
              order: order,
              paymentServiceProvider: paymentProviders.firstWhere(
                  (paymentProvider) =>
                      paymentProvider.key.key ==
                      order.payment.paymentServiceProvider.key),
              deliveryProvider: deliveryProviders.firstWhere(
                  (deliveryProvider) =>
                      deliveryProvider.key.key ==
                      order.delivery.deliveryProvider.key)))
          .toList();

      emit(state.copyWith(
          orders: mappedOrders,
          deliveryProviders: deliveryProviders,
          paymentServiceProviders: paymentProviders));
    });

    on<AcceptOrderEvent>((event, emit) async {
      final command = await orderRepository.acceptOrder(event.orderId);

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<OrderCommandResultEvent>((event, emit) async {
      emit(state.copyWith(
          commandResults: [...state.commandResults, event.commandResult]));

      add(AdminOrderOnLoadEvent());
    });

    on<BeginPackingOrderEvent>((event, emit) async {
      final command = await orderRepository.beginPackingOrder(event.orderId);

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<CancelOrderEvent>((event, emit) async {
      final command = await orderRepository.cancelOrder(event.orderId);

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<CompletePackingOrderEvent>((event, emit) async {
      final command = await orderRepository.completePackingOrder(
        event.orderId,
        event.width,
        event.height,
        event.length,
        event.weight,
      );

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<RejectOrderEvent>((event, emit) async {
      final command = await orderRepository.rejectOrder(event.orderId);

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<ReturnOrderEvent>((event, emit) async {
      final command = await orderRepository.returnOrder(event.orderId);

      if (command != null) {
        emit(state.copyWith(
            processingCommands: [...state.processingCommands, command]));
      }
    });

    on<RefreshDataEvent>(
      (event, emit) {
        add(AdminOrderOnLoadEvent());
      },
    );
    on<ChangeSelectionMutipleOrdersEvent>(
      (event, emit) {
        final ordersToSelect = state.orders.map((orderWrapper) {
          if (event.ids.contains(orderWrapper.id)) {
            return orderWrapper.copyWith(selected: event.value);
          }
          return orderWrapper;
        }).toList();

        emit(state.copyWith(orders: ordersToSelect));
      },
    );

    on<ChangeSelectionSingleOrderEvent>(
      (event, emit) {
        final ordersToSelect = state.orders.map((orderWrapper) {
          if (event.id.value == orderWrapper.id.value) {
            return orderWrapper.copyWith(selected: event.value);
          }
          return orderWrapper;
        }).toList();

        emit(state.copyWith(orders: ordersToSelect));
      },
    );

    on<UnselectAllOrdersEvent>(
      (event, emit) {
        final ordersToSelect = state.orders.map((orderWrapper) {
          return orderWrapper.copyWith(selected: false);
        }).toList();

        emit(state.copyWith(orders: ordersToSelect));
      },
    );

    on<AcceptOrdersBatchEvent>((event, emit) async {
      final batchCommand = await _batchCommandForOperation(
          (orderId) => orderRepository.acceptOrder(orderId), event.orderIds);

      emit(state
          .copyWith(batchCommands: [...state.batchCommands, batchCommand]));
    });

    on<RejectOrdersBatchEvent>((event, emit) async {
      final batchCommand = await _batchCommandForOperation(
          (orderId) => orderRepository.rejectOrder(orderId), event.orderIds);

      emit(state
          .copyWith(batchCommands: [...state.batchCommands, batchCommand]));
    });

    on<BeginPackingOrdersBatchEvent>((event, emit) async {
      final batchCommand = await _batchCommandForOperation(
          (orderId) => orderRepository.beginPackingOrder(orderId),
          event.orderIds);

      emit(state
          .copyWith(batchCommands: [...state.batchCommands, batchCommand]));
    });
  }
  /* 
    TODO - All batch commands should use batch endpoint for atomic operation - improve in future
  */
  Future<BatchCommand<OrderCommand>>
      _batchCommandForOperation<T extends OrderCommand>(
          Future<T?> Function(OrderId orderId) operationToExecute,
          List<OrderId> orderIds) async {
    List<T> commands = [];
    List<OrderId> failedIds = [];

    for (var orderId in orderIds) {
      final command = await operationToExecute(orderId);

      if (command == null) {
        failedIds.add(orderId);
      } else {
        commands.add(command);
      }
    }

    return BatchCommand<OrderCommand>(
        commands: commands,
        failedIds: failedIds.map((id) => id.value).toList());
  }
}
