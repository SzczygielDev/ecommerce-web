import 'package:ecommerce_web/domain/order/admin_order.dart';

abstract class AdminOrderRepositoryAbstraction {
  Future<List<AdminOrder>> getOrders();
}
