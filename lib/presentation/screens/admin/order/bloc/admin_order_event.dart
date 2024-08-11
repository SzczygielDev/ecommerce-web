part of 'admin_order_bloc.dart';

sealed class AdminOrderEvent extends Equatable {
  const AdminOrderEvent();

  @override
  List<Object> get props => [];
}

class AdminOrderOnLoadEvent extends AdminOrderEvent {}

class AcceptOrderEvent extends AdminOrderEvent {
  final OrderId orderId;

  const AcceptOrderEvent({required this.orderId});
}

class OrderCommandResultEvent extends AdminOrderEvent {
  final CommandResult commandResult;

  const OrderCommandResultEvent({required this.commandResult});
}
