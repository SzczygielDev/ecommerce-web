import 'package:ecommerce_web/domain/command/util/command_id.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';

sealed class Command {
  final CommandId id;

  const Command({required this.id});
}

sealed class OrderCommand extends Command {
  const OrderCommand({required super.id});
}

class AcceptOrderCommand extends OrderCommand {
  final OrderId orderId;

  const AcceptOrderCommand(
      {required CommandId commandId, required this.orderId})
      : super(id: commandId);
}
