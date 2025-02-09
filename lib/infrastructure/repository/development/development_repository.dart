import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/mock_payment.dart';
import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:ecommerce_web/infrastructure/repository/common/repository_base.dart';

class DevelopmentRepository extends RepositoryBase
    implements DevelopmentRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<MockPayment?> mockPayment(PaymentId paymentId, double amount) async {
    try {
      final response = await dio.post("/external/psp/pay/${paymentId.value}",
          queryParameters: {"amount": amount});

      return MockPayment.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<MockPayment?> getMockPayment(PaymentId paymentId) async {
    try {
      final response = await dio.get("/external/psp/${paymentId.value}");

      return MockPayment.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }
}
