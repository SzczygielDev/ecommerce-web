part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderOnLoadEvent extends OrderEvent {}

class CancelOrderEvent extends OrderEvent {
  final OrderId orderId;
  const CancelOrderEvent({required this.orderId});
}

class OrderCommandResultEvent extends OrderEvent {
  final CommandResult commandResult;

  const OrderCommandResultEvent({required this.commandResult});
}
