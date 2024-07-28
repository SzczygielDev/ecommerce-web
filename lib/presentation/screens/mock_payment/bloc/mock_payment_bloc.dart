import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/mock_payment.dart';
import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:equatable/equatable.dart';

part 'mock_payment_event.dart';
part 'mock_payment_state.dart';

class MockPaymentBloc extends Bloc<MockPaymentEvent, MockPaymentState> {
  final DevelopmentRepositoryAbstraction developmentRepository;
  MockPaymentBloc({required this.developmentRepository})
      : super(const MockPaymentState()) {
    on<MockPaymentOnLoadEvent>((event, emit) async {
      final paymentId = event.paymentId;
      final payment = await developmentRepository.getMockPayment(paymentId);
      emit(state.copyWith(payment: payment));
    });
    on<MockPaymentSubmitEvent>((event, emit) async {
      final result = await developmentRepository.mockPayment(
          PaymentId(state.payment!.id), event.value);

      emit(state.copyWith(result: result!.status));
    });
  }
}
