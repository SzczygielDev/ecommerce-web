import 'package:ecommerce_web/domain/command/util/command_id.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';

sealed class Command {
  final CommandId id;

  const Command({required this.id});
}

sealed class OrderCommand extends Command {
  final OrderId orderId;
  const OrderCommand({required super.id, required this.orderId});
}

class AcceptOrderCommand extends OrderCommand {
  const AcceptOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}

class BeginPackingOrderCommand extends OrderCommand {
  const BeginPackingOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}

class CancelOrderCommand extends OrderCommand {
  const CancelOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}

class CompletePackingOrderCommand extends OrderCommand {
  const CompletePackingOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}

class RejectOrderCommand extends OrderCommand {
  const RejectOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}

class ReturnOrderCommand extends OrderCommand {
  const ReturnOrderCommand(
      {required CommandId commandId, required super.orderId})
      : super(id: commandId);
}
