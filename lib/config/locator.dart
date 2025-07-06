import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/image/image_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/admin_payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/cart/cart_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/client/client_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/delivery/delivery_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/development/development_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/image/image_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/order/admin_order_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/order/order_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/payment/payment_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/product/product_admin_repository.dart';
import 'package:ecommerce_web/infrastructure/repository/product/product_repository.dart';
import 'package:ecommerce_web/infrastructure/service/auth/authentication_service.dart';
import 'package:ecommerce_web/infrastructure/util/token_interceptor.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';

final locator = GetIt.instance;

void setupLocator() {
  final oidcManager = OidcUserManager.lazy(
    discoveryDocumentUri:
        OidcUtils.getOpenIdConfigWellKnownUri(AppConsts.oidcWellKnownUri),
    clientCredentials: OidcClientAuthentication.none(
      clientId: AppConsts.oidcClientId,
    ),
    store: OidcDefaultStore(),
    settings: OidcUserManagerSettings(
        redirectUri: AppConsts.oidcRedirectUri,
        postLogoutRedirectUri: AppConsts.oidcLogoutRedirectUri),
  );
  final authenticationService = AuthenticationService(oidcManager);
  locator.registerLazySingleton<AuthenticationService>(
    () => authenticationService,
  );

  final dio = Dio(BaseOptions(baseUrl: AppConsts.apiUrl));
  dio.interceptors.add(TokenInterceptor(oidcManager));
  locator.registerLazySingleton<Dio>(
    () => dio,
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
  locator.registerLazySingleton<Logger>(
    () => Logger(),
  );
  locator.registerLazySingleton<ImageRepositoryAbstraction>(
    () => ImageRepository(),
  );

  locator.registerLazySingleton<AuthenticationServiceAbstraction>(
    () => authenticationService,
  );

  final clientRepository = ClientRepository();
  locator.registerLazySingleton<ClientRepositoryAbstraction>(
    () => clientRepository,
  );

  final authBloc = AuthenticationBloc(authenticationService, clientRepository);
  locator.registerLazySingleton<AuthenticationBloc>(
    () => authBloc,
  );
}
