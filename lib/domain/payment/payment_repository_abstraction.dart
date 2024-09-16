import 'payment_service_provider.dart';

abstract class PaymentRepositoryAbstraction {
  Future<List<PaymentServiceProvider>> getPaymentServiceProviders();
}
