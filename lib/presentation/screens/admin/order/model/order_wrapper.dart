import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/order/admin_order.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';

class OrderWrapper {
  final OrderId id;
  final bool selected;
  final AdminOrder order;
  final PaymentServiceProvider paymentServiceProvider;
  final DeliveryProvider deliveryProvider;

  const OrderWrapper(
      {required this.id,
      required this.selected,
      required this.order,
      required this.paymentServiceProvider,
      required this.deliveryProvider});

  OrderWrapper copyWith({
    OrderId? id,
    bool? selected,
    AdminOrder? order,
    PaymentServiceProvider? paymentServiceProvider,
    DeliveryProvider? deliveryProvider,
  }) {
    return OrderWrapper(
      id: id ?? this.id,
      selected: selected ?? this.selected,
      order: order ?? this.order,
      paymentServiceProvider:
          paymentServiceProvider ?? this.paymentServiceProvider,
      deliveryProvider: deliveryProvider ?? this.deliveryProvider,
    );
  }
}
