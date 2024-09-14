import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/view/product_main_section.dart';
import 'package:ecommerce_web/presentation/screens/product/view/product_photo_section.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/added_to_cart_overlay.dart';
import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = "products";
  static const productIdPathParam = "productId";
  static const route = "/$routeName/:$productIdPathParam";
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) => true,
      child: ScrollableGenericPage(
          overlay: const AddedToCartOverlay(),
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 50,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ProductPhotoSection(),
                    ),
                    Expanded(child: ProductMainSection())
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Divider(),
              ),
              FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          switch (state.loadingState) {
                            case ProductLoadingState.loading:
                            case ProductLoadingState.error:
                              return const SizedBox.shrink();
                            case ProductLoadingState.loaded:
                              return Text(
                                state.product!.description,
                                style:
                                    AppTypography.small2.merge(const TextStyle(
                                  wordSpacing: 3,
                                  height: 1.75,
                                )),
                              );
                          }
                        },
                      )
                    ],
                  )),
              const SizedBox(
                height: 150,
              )
            ],
          )),
    );
  }
}
