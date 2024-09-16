part of 'mock_payment_bloc.dart';

sealed class MockPaymentEvent extends Equatable {
  const MockPaymentEvent();

  @override
  List<Object> get props => [];
}

class MockPaymentOnLoadEvent extends MockPaymentEvent {
  final PaymentId paymentId;
  const MockPaymentOnLoadEvent({required this.paymentId});
}

class MockPaymentSubmitEvent extends MockPaymentEvent {
  final double value;
  const MockPaymentSubmitEvent({required this.value});
}
