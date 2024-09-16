import 'package:ecommerce_web/domain/product/product_price_change.dart';

import 'product_id.dart';

class AdminProduct {
  final ProductId id;
  final String title;
  final String description;
  final double price;
  final List<ProductPriceChange> priceChanges;

  const AdminProduct(
      {required this.id,
      required this.description,
      required this.title,
      required this.price,
      required this.priceChanges});

  factory AdminProduct.fromJson(Map<String, dynamic> json) => AdminProduct(
        id: ProductId(json["productId"]),
        title: json["title"],
        description: json["description"],
        price: json["price"],
        priceChanges: (json["priceChanges"] as List)
            .map((x) => ProductPriceChange.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "productId": id,
        "title": title,
        "description": description,
        "price": price,
        "priceChanges": List<dynamic>.from(priceChanges.map((x) => x.toJson())),
      };
}
