import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';

class OrderRepository extends OrderRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<List<Order>> getOrders() async {
    try {
      final response = await dio.get<List>("/orders");

      var models = (response.data ?? [])
          .map(
            (e) => Order.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }
}
