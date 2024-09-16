import 'package:ecommerce_web/domain/delivery/delivery.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/domain/payment/payment.dart';

import '../cart/cart_id.dart';
import 'order_id.dart';
import 'order_item.dart';

class Order {
  final OrderId id;
  final CartId cartId;
  final OrderStatus status;
  final Payment payment;
  final Delivery delivery;
  final DateTime createdAt;
  final List<OrderItem> items;

  const Order(
      {required this.id,
      required this.cartId,
      required this.status,
      required this.payment,
      required this.delivery,
      required this.createdAt,
      required this.items});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: OrderId(json["orderId"]),
      cartId: CartId(json["cartId"]),
      status: OrderStatus.fromString(json["status"])!,
      payment: Payment.fromJson(json["payment"]),
      delivery: Delivery.fromJson(json["delivery"]),
      createdAt: DateTime.parse(json["createdAt"]),
      items:
          (json["items"] as List).map((e) => OrderItem.fromJson(e)).toList());

  Map<String, dynamic> toJson() => {
        "orderId": id,
        "cartId": cartId,
        "status": status,
        "payment": payment.toJson(),
        "delivery": delivery.toJson(),
        "items": List.of(items.map((e) => e.toJson()))
      };

  bool canBeCanceled() {
    return status == OrderStatus.created ||
        status == OrderStatus.accepted ||
        status == OrderStatus.inProgress ||
        status == OrderStatus.ready;
  }
}
