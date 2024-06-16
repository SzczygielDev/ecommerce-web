import 'package:ecommerce_web/domain/cart/cart_entry.dart';
import 'package:ecommerce_web/domain/cart/cart_id.dart';

class Cart {
  CartId id;
  List<CartEntry> products;
  double total;

  Cart({required this.id, required this.products, required this.total});
}
