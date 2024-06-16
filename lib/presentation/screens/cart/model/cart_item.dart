import 'package:ecommerce_web/domain/product/product_id.dart';

class CartItem {
  ProductId productId;
  String title;
  String subtitle;
  double price;
  int quantity;

  CartItem(
      {required this.title,
      required this.productId,
      required this.subtitle,
      required this.price,
      required this.quantity});
}
