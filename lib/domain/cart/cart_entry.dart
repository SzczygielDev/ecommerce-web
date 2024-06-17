import 'package:ecommerce_web/domain/product/product_id.dart';

class CartEntry {
  ProductId productId;
  int quantity;

  CartEntry({required this.productId, required this.quantity});
}
