import 'package:ecommerce_web/domain/cart/cart_entry.dart';
import 'package:ecommerce_web/domain/cart/cart_id.dart';

import 'cart_status.dart';

class Cart {
  CartId id;
  CartStatus status;
  List<CartEntry> products;
  double total;

  Cart(
      {required this.id,
      required this.status,
      required this.products,
      required this.total});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: CartId(json["cartId"]),
        status: CartStatus.fromString(json["status"])!,
        products: List<CartEntry>.from(
            json["products"].map((x) => CartEntry.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "cartId": id.value,
        "status": status.toString(),
        "products": List<dynamic>.from((products ?? []).map((x) => x.toJson())),
        "total": total,
      };
}
