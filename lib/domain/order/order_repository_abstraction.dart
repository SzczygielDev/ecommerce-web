import 'package:ecommerce_web/domain/order/order.dart';

abstract class OrderRepositoryAbstraction {
  Future<List<Order>> getOrders();
}
