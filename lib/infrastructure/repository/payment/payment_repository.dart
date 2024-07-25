import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';

class PaymentRepository extends PaymentRepositoryAbstraction {
  final dio = locator.get<Dio>();
  @override
  Future<List<PaymentServiceProvider>> getPaymentServiceProviders() async {
    try {
      final response = await dio.get<List>("/payments/providers");

      var models = (response.data ?? [])
          .map(
            (e) => PaymentServiceProvider.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }
}
