import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/add_to_cart_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_header_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_lowest_price_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_option_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMainSection extends StatefulWidget {
  const ProductMainSection({super.key});

  @override
  State<ProductMainSection> createState() => _ProductMainSectionState();
}

class _ProductMainSectionState extends State<ProductMainSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          const ProductHeaderWidget(),
          const ProductPriceWidget(),
          const ProductLowestPriceWidget(),
          const SizedBox(
            height: 40,
          ),
          const ProductOptionWidget(),
          const Spacer(),
          SizedBox(
              height: 85,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return AddToCartWidget(
                    enabled: !state.isUserAdmin,
                  );
                },
              ))
        ],
      ),
    );
  }
}
