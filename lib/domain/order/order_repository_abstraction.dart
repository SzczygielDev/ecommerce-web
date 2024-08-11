import 'package:ecommerce_web/domain/cart/cart_id.dart';
import 'package:ecommerce_web/domain/command/commands.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';

abstract class OrderRepositoryAbstraction {
  Future<Order?> getOrder(OrderId id);
  Future<Order?> getOrderByCartId(CartId id);
  Future<List<Order>> getOrders();

  Future<AcceptOrderCommand?> acceptOrder(OrderId id);
  Stream<CommandResult> get orderCommandResults;
}
