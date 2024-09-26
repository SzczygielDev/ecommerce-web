import 'package:ecommerce_web/domain/image/image_id.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

class OrderItem {
  final ProductId productId;
  final String title;
  final double price;
  final int quantity;
  final ImageId imageId;

  OrderItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageId,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
      productId: ProductId(json["productId"]),
      title: json["title"],
      price: json["price"],
      quantity: json["quantity"],
      imageId: ImageId(json["imageId"]));

  Map<String, dynamic> toJson() => {
        "productId": productId.value,
        "title": title,
        "price": price,
        "quantity": quantity,
        "imageId": imageId.value
      };
}
