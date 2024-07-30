part of 'payment_result_bloc.dart';

enum PaymentResultLoadingState { loading, success, error }

class PaymentResultState extends Equatable {
  final PaymentResultLoadingState resultState;
  final String? paymentUrl;

  const PaymentResultState(
      {this.resultState = PaymentResultLoadingState.loading, this.paymentUrl});

  PaymentResultState copyWith(
      {PaymentResultLoadingState? resultState, String? paymentUrl}) {
    return PaymentResultState(
        resultState: resultState ?? this.resultState,
        paymentUrl: paymentUrl ?? this.paymentUrl);
  }

  @override
  List<Object?> get props => [resultState, paymentUrl];
}
