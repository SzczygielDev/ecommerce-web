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
}
