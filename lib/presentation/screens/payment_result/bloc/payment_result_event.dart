part of 'payment_result_bloc.dart';

sealed class PaymentResultEvent extends Equatable {
  const PaymentResultEvent();

  @override
  List<Object> get props => [];
}

class PaymentResultOnLoadEvent extends PaymentResultEvent {
  final OrderId orderId;
  const PaymentResultOnLoadEvent({required this.orderId});
}
