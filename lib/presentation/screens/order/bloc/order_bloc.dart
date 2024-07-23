import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepositoryAbstraction orderRepository;
  OrderBloc({required this.orderRepository}) : super(OrderState()) {
    on<OrderOnLoadEvent>((event, emit) async {
      final orders = await orderRepository.getOrders();
      emit(state.copyWith(
          orders: orders, loadingState: OrderLoadingState.loaded));
    });
  }
}
