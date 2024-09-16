import 'package:ecommerce_web/domain/delivery/delivery.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/domain/payment/admin_payment.dart';

import '../cart/cart_id.dart';
import 'order_id.dart';
import 'order_item.dart';

class AdminOrder {
  final OrderId id;
  final CartId cartId;
  final OrderStatus status;
  final AdminPayment payment;
  final Delivery delivery;
  final DateTime createdAt;
  final List<OrderItem> items;

  const AdminOrder(
      {required this.id,
      required this.cartId,
      required this.status,
      required this.payment,
      required this.delivery,
      required this.createdAt,
      required this.items});

  factory AdminOrder.fromJson(Map<String, dynamic> json) => AdminOrder(
      id: OrderId(json["orderId"]),
      cartId: CartId(json["cartId"]),
      status: OrderStatus.fromString(json["status"])!,
      payment: AdminPayment.fromJson(json["payment"]),
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
