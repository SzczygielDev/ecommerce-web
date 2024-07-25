import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

abstract class CartRepositoryAbstraction {
  Future<Cart?> getCart();
  Future<bool> submitCart(DeliveryProvider deliveryProvider,
      PaymentServiceProvider paymentServiceProvider);
  Future<Cart?> addProductToCart(ProductId productId, int quantity);
  Future<Cart?> removeProductFromCart(ProductId productId);
}
