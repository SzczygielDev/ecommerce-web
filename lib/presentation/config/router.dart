import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/development/development_repository_abstraction.dart';
import 'package:ecommerce_web/domain/image/image_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/service/auth/authentication_service.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/admin_catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/bloc/admin_catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/admin_dashboard_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/admin_order_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/users/admin_user_screen.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/onboard/bloc/onboard_bloc.dart';
import 'package:ecommerce_web/presentation/screens/onboard/onboard_screen.dart';
import 'package:ecommerce_web/presentation/screens/profile/profile_screen.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/bloc/mock_payment_bloc.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/mock_payment_screen.dart';
import 'package:ecommerce_web/presentation/screens/not_found/not_found_screen.dart';
import 'package:ecommerce_web/presentation/screens/order/bloc/order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/order/order_screen.dart';
import 'package:ecommerce_web/presentation/screens/payment_result/bloc/payment_result_bloc.dart';
import 'package:ecommerce_web/presentation/screens/payment_result/payment_result_screen.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/product_screen.dart';
import 'package:ecommerce_web/presentation/util/state/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

final router = GoRouter(
  refreshListenable:
      GoRouterRefreshStream(locator.get<AuthenticationBloc>().stream),
  redirect: (context, state) {
    final authBloc = locator.get<AuthenticationBloc>();

    final authState = authBloc.state;
    final isAuthenticated = authState is AuthenticatedState;

    final allowedPathsForUnauthenticated = <String>{
      '/',
      ProductScreen.route,
      MockPaymentScreen.route,
      PaymentResultScreen.route,
    };

    if (isAuthenticated) {
      final isOnboarded = authState.client != null;

      if (isOnboarded) {
        if (state.fullPath == OnBoardScreen.route) {
          return '/';
        }

        return null;
      } else {
        return OnBoardScreen.route;
      }
    }

    if (!allowedPathsForUnauthenticated.contains(state.fullPath)) {
      return '/';
    }

    return null;
  },
  errorPageBuilder: (context, state) =>
      buildPageWithTransition(context, state, const NotFoundScreen()),
  routes: [
    /*
    For now we will use CatalogScreen as main screen. 

    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    */
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithTransition(
        context,
        state,
        BlocProvider(
          create: (context) => CatalogBloc(
              productRepository: locator.get<ProductRepositoryAbstraction>())
            ..add(CatalogOnLoadEvent()),
          child: const CatalogScreen(),
        ),
      ),
    ),
    GoRoute(
      name: ProductScreen.routeName,
      path: ProductScreen.route,
      pageBuilder: (context, state) {
        var productId = state.pathParameters[ProductScreen.productIdPathParam];

        //todo handle null path param
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => ProductBloc(
                  cartRepository: locator.get<CartRepositoryAbstraction>(),
                  productRepository:
                      locator.get<ProductRepositoryAbstraction>(),
                  logger: locator.get<Logger>())
                ..add(ProductOnLoadEvent(ProductId(productId!))),
              child: const ProductScreen(),
            ));
      },
    ),
    GoRoute(
      path: CartScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => CartBloc(
                  orderRepository: locator.get<OrderRepositoryAbstraction>(),
                  paymentRepository:
                      locator.get<PaymentRepositoryAbstraction>(),
                  deliveryRepository:
                      locator.get<DeliveryRepositoryAbstraction>(),
                  productRepository:
                      locator.get<ProductRepositoryAbstraction>(),
                  cartRepository: locator.get<CartRepositoryAbstraction>(),
                  logger: locator.get<Logger>(),
                  clientRepository: locator.get<ClientRepositoryAbstraction>())
                ..add(const CartOnLoadEvent()),
              child: const CartScreen(),
            ));
      },
    ),
    GoRoute(
      path: OrderScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => OrderBloc(
                  orderRepository: locator.get<OrderRepositoryAbstraction>(),
                  logger: locator.get<Logger>())
                ..add(OrderOnLoadEvent()),
              child: const OrderScreen(),
            ));
      },
    ),
    GoRoute(
      name: MockPaymentScreen.routeName,
      path: MockPaymentScreen.route,
      pageBuilder: (context, state) {
        var paymentId =
            state.pathParameters[MockPaymentScreen.paymentIdPathParam];

        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
                create: (context) => MockPaymentBloc(
                    developmentRepository:
                        locator.get<DevelopmentRepositoryAbstraction>())
                  ..add(
                      MockPaymentOnLoadEvent(paymentId: PaymentId(paymentId!))),
                child: const MockPaymentScreen()));
      },
    ),
    GoRoute(
      path: PaymentResultScreen.route,
      pageBuilder: (context, state) {
        var orderId =
            state.pathParameters[PaymentResultScreen.orderIdPathParam];

        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => PaymentResultBloc(
                  orderRepository: locator.get<OrderRepositoryAbstraction>())
                ..add(PaymentResultOnLoadEvent(orderId: OrderId(orderId!))),
              child: const PaymentResultScreen(),
            ));
      },
    ),
    GoRoute(
      path: AdminDashboardScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context, state, const AdminDashboardScreen());
      },
    ),
    GoRoute(
      path: AdminOrderScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => AdminOrderBloc(
                  adminOrderRepository: locator.get(),
                  orderRepository: locator.get(),
                  deliveryRepository: locator.get(),
                  paymentRepository: locator.get(),
                  logger: locator.get<Logger>())
                ..add(AdminOrderOnLoadEvent()),
              child: const AdminOrderScreen(),
            ));
      },
    ),
    GoRoute(
      path: AdminCatalogScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => AdminCatalogBloc(
                  logger: locator.get<Logger>(),
                  productRepository:
                      locator.get<ProductRepositoryAbstraction>(),
                  imageRepository: locator.get<ImageRepositoryAbstraction>())
                ..add(AdminCatalogOnLoadEvent()),
              child: const AdminCatalogScreen(),
            ));
      },
    ),
    GoRoute(
      path: AdminUserScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(context, state, const AdminUserScreen());
      },
    ),
    GoRoute(
      path: ProfileScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(context, state, const ProfileScreen());
      },
    ),
    GoRoute(
      path: OnBoardScreen.route,
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
                create: (context) => OnboardBloc(
                    locator.get<ClientRepositoryAbstraction>(),
                    locator.get<AuthenticationService>())
                  ..add(OnboardLoadEvent()),
                child: const OnBoardScreen()));
      },
    ),
  ],
);

Page buildPageWithTransition(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
