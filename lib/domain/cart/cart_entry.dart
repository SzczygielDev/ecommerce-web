import 'package:ecommerce_web/domain/product/product_id.dart';

class CartEntry {
  ProductId productId;
  int quantity;

  CartEntry({required this.productId, required this.quantity});

  factory CartEntry.fromJson(Map<String, dynamic> json) => CartEntry(
        productId: ProductId(json["productId"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId.value,
        "quantity": quantity,
      };
}
