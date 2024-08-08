part of 'admin_order_bloc.dart';

class AdminOrderState extends Equatable {
  final List<OrderWrapper> orders;
  final List<PaymentServiceProvider> paymentServiceProviders;
  final List<DeliveryProvider> deliveryProviders;

  const AdminOrderState(
      {this.orders = const [],
      this.paymentServiceProviders = const [],
      this.deliveryProviders = const []});

  AdminOrderState copyWith({
    List<OrderWrapper>? orders,
    List<PaymentServiceProvider>? paymentServiceProviders,
    List<DeliveryProvider>? deliveryProviders,
  }) {
    return AdminOrderState(
        orders: orders ?? this.orders,
        paymentServiceProviders:
            paymentServiceProviders ?? this.paymentServiceProviders,
        deliveryProviders: deliveryProviders ?? this.deliveryProviders);
  }

  @override
  List<Object> get props =>
      [orders, paymentServiceProviders, deliveryProviders];
}
