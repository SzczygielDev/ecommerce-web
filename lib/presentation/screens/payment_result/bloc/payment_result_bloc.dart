import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:equatable/equatable.dart';

part 'payment_result_event.dart';
part 'payment_result_state.dart';

class PaymentResultBloc extends Bloc<PaymentResultEvent, PaymentResultState> {
  final OrderRepositoryAbstraction orderRepository;
  PaymentResultBloc({required this.orderRepository})
      : super(const PaymentResultState()) {
    on<PaymentResultOnLoadEvent>((event, emit) async {
      var order = await orderRepository.getOrder(event.orderId);
      PaymentStatus? paymentStatus = order?.payment.status;

      var iteration = 0;
      while (paymentStatus == PaymentStatus.unpaid &&
          iteration <= AppConsts.paymentWaitingRetries) {
        await Future.delayed(AppConsts.paymentWaitingDuration);

        order = await orderRepository.getOrder(event.orderId);
        paymentStatus = order?.payment.status;

        iteration++;
      }

      if (paymentStatus == PaymentStatus.paid) {
        emit(state.copyWith(resultState: PaymentResultLoadingState.success));
      } else {
        emit(state.copyWith(
            resultState: PaymentResultLoadingState.error,
            paymentUrl: order!.payment.paymentURL));
      }
    });
  }
}
