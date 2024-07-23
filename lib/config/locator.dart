import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/cart_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/order/order_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/product/product_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: AppConsts.apiUrl)),
  );

  locator.registerLazySingleton<ProductRepositoryAbstraction>(
      () => ProductRepository());
  locator.registerLazySingleton<CartRepositoryAbstraction>(
    () => CartRepository(),
  );

  locator.registerLazySingleton<OrderRepositoryAbstraction>(
    () => OrderRepository(),
  );
}
