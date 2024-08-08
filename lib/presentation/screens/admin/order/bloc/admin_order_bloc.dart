import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/admin_payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:equatable/equatable.dart';

part 'admin_order_event.dart';
part 'admin_order_state.dart';

class AdminOrderBloc extends Bloc<AdminOrderEvent, AdminOrderState> {
  final AdminOrderRepositoryAbstraction orderRepository;
  final PaymentRepositoryAbstraction paymentRepository;
  final DeliveryRepositoryAbstraction deliveryRepository;
  AdminOrderBloc(
      {required this.orderRepository,
      required this.paymentRepository,
      required this.deliveryRepository})
      : super(const AdminOrderState()) {
    on<AdminOrderOnLoadEvent>((event, emit) async {
      final orders = await orderRepository.getOrders();
      final paymentProviders =
          await paymentRepository.getPaymentServiceProviders();
      final deliveryProviders = await deliveryRepository.getDeliveryProviders();

      final mappedOrders = orders
          .map((order) => OrderWrapper(
              order: order,
              paymentServiceProvider: paymentProviders.firstWhere(
                  (paymentProvider) =>
                      paymentProvider.key.key ==
                      order.payment.paymentServiceProvider.key),
              deliveryProvider: deliveryProviders.firstWhere(
                  (deliveryProvider) =>
                      deliveryProvider.key.key ==
                      order.delivery.deliveryProvider.key)))
          .toList();

      emit(state.copyWith(
          orders: mappedOrders,
          deliveryProviders: deliveryProviders,
          paymentServiceProviders: paymentProviders));
    });
  }
}
