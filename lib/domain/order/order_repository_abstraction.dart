import 'package:ecommerce_web/domain/cart/cart_id.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';

abstract class OrderRepositoryAbstraction {
  Future<Order?> getOrder(OrderId id);
  Future<Order?> getOrderByCartId(CartId id);
  Future<List<Order>> getOrders();
}
