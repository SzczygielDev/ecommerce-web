import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

abstract class CartRepositoryAbstraction {
  Future<Cart?> getCart();
  Future<void> submitCart();
  Future<Cart?> addProductToCart(ProductId productId, int quantity);
  Future<Cart?> removeProductFromCart(ProductId productId);
}
