import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/order/admin_order.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';

class OrderWrapper {
  final AdminOrder order;
  final PaymentServiceProvider paymentServiceProvider;
  final DeliveryProvider deliveryProvider;

  const OrderWrapper(
      {required this.order,
      required this.paymentServiceProvider,
      required this.deliveryProvider});
}
