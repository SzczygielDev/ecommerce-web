import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepositoryAbstraction orderRepository;
  late final StreamSubscription<CommandResult> orderCommandResults;
  OrderBloc({required this.orderRepository}) : super(const OrderState()) {
    orderCommandResults = orderRepository.orderCommandResults.listen(
      onError: (e) => print(e),
      (commandResult) =>
          add(OrderCommandResultEvent(commandResult: commandResult)),
    );

    on<OrderOnLoadEvent>((event, emit) async {
      final orders = await orderRepository.getOrders();
      emit(state.copyWith(
          orders: orders, loadingState: OrderLoadingState.loaded));
    });

    on<CancelOrderEvent>((event, emit) async {
      await orderRepository.cancelOrder(event.orderId);
    });

    on<OrderCommandResultEvent>((event, emit) async {
      add(OrderOnLoadEvent());
    });
  }
}
