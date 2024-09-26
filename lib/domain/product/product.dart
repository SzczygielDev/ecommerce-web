import 'package:ecommerce_web/domain/image/image_id.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

class Product {
  final ProductId id;
  final String title;
  final String description;
  final double price;
  final ImageId imageId;

  const Product(
      {required this.id,
      required this.description,
      required this.title,
      required this.price,
      required this.imageId});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: ProductId(json["productId"]),
      title: json["title"],
      description: json["description"],
      price: json["price"],
      imageId: ImageId(json["imageId"]));

  Map<String, dynamic> toJson() => {
        "productId": id.value,
        "title": title,
        "description": description,
        "price": price,
        "imageId": imageId.value
      };

  Product copyWith({
    ProductId? id,
    String? title,
    String? description,
    double? price,
    ImageId? imageId,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imageId: imageId ?? this.imageId,
    );
  }
}
