import 'package:ecommerce_web/domain/development/mock_payment.dart';
import 'package:ecommerce_web/domain/payment/payment_id.dart';

abstract class DevelopmentRepositoryAbstraction {
  Future<MockPayment?> mockPayment(PaymentId paymentId, double amount);
  Future<MockPayment?> getMockPayment(PaymentId paymentId);
}
