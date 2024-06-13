import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_web/presentation/screens/product/product_screen.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) => CatalogBloc(
            productRepository: locator.get<ProductRepositoryAbstraction>())
          ..add(CatalogOnLoadEvent()),
        child: const CatalogScreen(),
      ),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => ProductScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
    ),
  ],
);
