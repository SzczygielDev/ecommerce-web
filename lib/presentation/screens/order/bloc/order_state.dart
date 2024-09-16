part of 'order_bloc.dart';

enum OrderLoadingState { loading, loaded, error }

class OrderState extends Equatable {
  final OrderLoadingState loadingState;
  final List<Order> orders;
  const OrderState(
      {this.loadingState = OrderLoadingState.loading, this.orders = const []});

  OrderState copyWith({
    OrderLoadingState? loadingState,
    List<Order>? orders,
  }) {
    return OrderState(
        loadingState: loadingState ?? this.loadingState,
        orders: orders ?? this.orders);
  }

  @override
  List<Object> get props => [loadingState, orders];
}
