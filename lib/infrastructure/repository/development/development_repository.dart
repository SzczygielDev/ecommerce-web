import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/mock_payment.dart';
import 'package:ecommerce_web/domain/payment/payment_id.dart';

class DevelopmentRepository extends DevelopmentRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<MockPayment?> mockPayment(PaymentId paymentId, double amount) async {
    try {
      final response = await dio.post(
          "/development/mockPayment/${paymentId.value}",
          queryParameters: {"amount": amount});

      return MockPayment.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<MockPayment?> getMockPayment(PaymentId paymentId) async {
    try {
      final response =
          await dio.get("/development/mockPayment/${paymentId.value}");

      return MockPayment.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }
}
