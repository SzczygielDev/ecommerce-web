import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/command/commands.dart';
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
  }
}
