import 'package:ecommerce_web/domain/product/product_id.dart';

class Product {
  final ProductId id;
  final String title;
  final String description;
  final double price;

  const Product(
      {required this.id,
      required this.description,
      required this.title,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: ProductId(json["productId"]),
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": id.value,
        "title": title,
        "description": description,
        "price": price,
      };
}
