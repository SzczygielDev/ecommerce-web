import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_entry.dart';
import 'package:ecommerce_web/domain/cart/cart_id.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/model/cart_dto.dart';

extension CartMapper on CartDto {
  Cart toModel() {
    return Cart(
        id: CartId(cartId),
        total: total,
        products: products
            .map(
              (entry) => CartEntry(
                  productId: ProductId(entry.productId),
                  quantity: entry.quantity),
            )
            .toList());
  }
}
