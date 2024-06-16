import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/mapper/cart_mapper.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/model/cart_dto.dart';

class CartRepository extends CartRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<void> addProductToCart(ProductId productId, int quantity) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
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
  Future<void> removeProductFromCart(ProductId productId) {
    // TODO: implement removeProductFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> submitCart() {
    // TODO: implement submitCart
    throw UnimplementedError();
  }
}
