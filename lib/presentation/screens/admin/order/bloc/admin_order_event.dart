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

class BeginPackingOrderEvent extends AdminOrderEvent {
  final OrderId orderId;

  const BeginPackingOrderEvent({required this.orderId});
}

class CancelOrderEvent extends AdminOrderEvent {
  final OrderId orderId;

  const CancelOrderEvent({required this.orderId});
}

class CompletePackingOrderEvent extends AdminOrderEvent {
  final OrderId orderId;
  final double width;
  final double height;
  final double length;
  final double weight;
  const CompletePackingOrderEvent(
      {required this.orderId,
      required this.height,
      required this.length,
      required this.weight,
      required this.width});
}

class RejectOrderEvent extends AdminOrderEvent {
  final OrderId orderId;

  const RejectOrderEvent({required this.orderId});
}

class ReturnOrderEvent extends AdminOrderEvent {
  final OrderId orderId;

  const ReturnOrderEvent({required this.orderId});
}

class RefreshDataEvent extends AdminOrderEvent {}

class ChangeSelectionMutipleOrdersEvent extends AdminOrderEvent {
  final List<OrderId> ids;
  final bool value;
  const ChangeSelectionMutipleOrdersEvent(
      {required this.ids, required this.value});
}

class ChangeSelectionSingleOrderEvent extends AdminOrderEvent {
  final OrderId id;
  final bool value;
  const ChangeSelectionSingleOrderEvent(
      {required this.id, required this.value});
}

class UnselectAllOrdersEvent extends AdminOrderEvent {}

class AcceptOrdersBatchEvent extends AdminOrderEvent {
  final List<OrderId> orderIds;

  const AcceptOrdersBatchEvent({required this.orderIds});
}

class RejectOrdersBatchEvent extends AdminOrderEvent {
  final List<OrderId> orderIds;

  const RejectOrdersBatchEvent({required this.orderIds});
}

class BeginPackingOrdersBatchEvent extends AdminOrderEvent {
  final List<OrderId> orderIds;

  const BeginPackingOrdersBatchEvent({required this.orderIds});
}
