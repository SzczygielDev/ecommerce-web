import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/mapper/cart_mapper.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/model/add_item_to_cart_request.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/model/cart_dto.dart';

import 'model/cart_submit_request.dart';

class CartRepository extends CartRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<Cart?> addProductToCart(ProductId productId, int quantity) async {
    try {
      final response = await dio.post("/carts/${AppConsts.cartId}/items",
          data: AddItemToCartRequest(
                  productId: productId.value, quantity: quantity)
              .toJson());

      return CartDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Cart?> getCart() async {
    try {
      final response = await dio.get("/carts/${AppConsts.cartId}");

      return CartDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Cart?> removeProductFromCart(ProductId productId) async {
    try {
      final response = await dio.delete(
        "/carts/${AppConsts.cartId}/items/${productId.value}",
      );

      return CartDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<bool> submitCart(DeliveryProvider deliveryProvider,
      PaymentServiceProvider paymentServiceProvider) async {
    try {
      final response = await dio.post("/carts/${AppConsts.cartId}/submit",
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
