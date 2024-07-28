part of 'mock_payment_bloc.dart';

enum MockPaymentResult { success, error }

class MockPaymentState extends Equatable {
  final MockPayment? payment;
  final String? result;
  const MockPaymentState({this.payment, this.result});

  MockPaymentState copyWith({MockPayment? payment, String? result}) {
    return MockPaymentState(
        payment: payment ?? this.payment, result: result ?? this.result);
  }

  @override
  List<Object?> get props => [payment, result];
}
