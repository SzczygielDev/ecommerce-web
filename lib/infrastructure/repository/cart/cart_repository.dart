import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/model/add_item_to_cart_request.dart';

import 'model/cart_submit_request.dart';

class CartRepository extends CartRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<Cart?> addProductToCart(ProductId productId, int quantity) async {
    try {
      final response = await dio.post("/carts/items",
          data: AddItemToCartRequest(
                  productId: productId.value, quantity: quantity)
              .toJson());

      return Cart.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Cart?> getCart() async {
    try {
      final response = await dio.get("/carts");

      return Cart.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Cart?> removeProductFromCart(ProductId productId) async {
    try {
      final response = await dio.delete(
        "/carts/items/${productId.value}",
      );

      return Cart.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<bool> submitCart(DeliveryProvider deliveryProvider,
      PaymentServiceProvider paymentServiceProvider) async {
    try {
      final response = await dio.post("/carts/submit",
          data: CartSubmitRequest(
                  deliveryProvider: deliveryProvider.key.key,
                  paymentServiceProvider: paymentServiceProvider.key.key)
              .toJson());

      return true;
    } on Exception catch (ex) {
      return false;
    }
  }
}
