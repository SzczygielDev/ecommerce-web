import 'package:ecommerce_web/domain/delivery/delivery.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/domain/payment/payment.dart';

import '../cart/cart_id.dart';
import 'order_id.dart';

class Order {
  final OrderId id;
  final CartId cartId;
  final OrderStatus status;
  final Payment payment;
  final Delivery delivery;
  final DateTime createdAt;

  const Order(
      {required this.id,
      required this.cartId,
      required this.status,
      required this.payment,
      required this.delivery,
      required this.createdAt});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: OrderId(json["orderId"]),
      cartId: CartId(json["cartId"]),
      status: OrderStatus.fromString(json["status"])!,
      payment: Payment.fromJson(json["payment"]),
      delivery: Delivery.fromJson(json["delivery"]),
      createdAt: DateTime.parse(json["createdAt"]));

  Map<String, dynamic> toJson() => {
        "orderId": id,
        "cartId": cartId,
        "status": status,
        "payment": payment.toJson(),
        "delivery": delivery.toJson(),
      };
}
