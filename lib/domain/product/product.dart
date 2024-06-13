import 'package:ecommerce_web/domain/product/product_id.dart';

class Product {
  ProductId id;
  String title;
  String description;
  double price;

  Product(
      {required this.id,
      required this.description,
      required this.title,
      required this.price});
}
