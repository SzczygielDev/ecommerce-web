import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

abstract class CartRepositoryAbstraction {
  Future<Cart?> getCart();
  Future<void> submitCart();
  Future<void> addProductToCart(ProductId productId, int quantity);
  Future<void> removeProductFromCart(ProductId productId);
}
