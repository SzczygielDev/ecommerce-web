import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
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
                  productRepository:
                      locator.get<ProductRepositoryAbstraction>())
                ..add(ProductOnLoadEvent(ProductId(productId!))),
              child: ProductScreen(),
            ));
      },
    ),
    GoRoute(
      path: '/cart',
      pageBuilder: (context, state) {
        return buildPageWithTransition(
            context,
            state,
            BlocProvider(
              create: (context) => CartBloc(
                  productRepository:
                      locator.get<ProductRepositoryAbstraction>(),
                  cartRepository: locator.get<CartRepositoryAbstraction>())
                ..add(CartOnLoadEvent()),
              child: CartScreen(),
            ));
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
