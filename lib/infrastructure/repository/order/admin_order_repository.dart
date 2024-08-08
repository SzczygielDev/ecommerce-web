import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/order/admin_order.dart';
import 'package:ecommerce_web/domain/order/admin_payment_repository_abstraction.dart';

class AdminOrderRepository extends AdminOrderRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<List<AdminOrder>> getOrders() async {
    try {
      final response = await dio.get<List>("/admin/orders");

      var models = (response.data ?? [])
          .map(
            (e) => AdminOrder.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }
}
