import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/admin_payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/cart_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/delivery/delivery_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/development/development_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/order/admin_order_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/order/order_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/payment/payment_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/product/product_admin_repository.dart';
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

  locator.registerLazySingleton<DeliveryRepositoryAbstraction>(
    () => DeliveryRepository(),
  );
  locator.registerLazySingleton<PaymentRepositoryAbstraction>(
    () => PaymentRepository(),
  );
  locator.registerLazySingleton<DevelopmentRepositoryAbstraction>(
    () => DevelopmentRepository(),
  );

  locator.registerLazySingleton<ProductAdminRepositoryAbstraction>(
    () => ProductAdminRepository(),
  );

  locator.registerLazySingleton<AdminOrderRepositoryAbstraction>(
    () => AdminOrderRepository(),
  );
}
