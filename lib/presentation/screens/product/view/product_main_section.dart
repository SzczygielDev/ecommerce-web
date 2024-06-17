import 'package:ecommerce_web/presentation/screens/product/widget/add_to_cart_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_header_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_lowest_price_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_option_widget.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_price_widget.dart';
import 'package:flutter/material.dart';

class ProductMainSection extends StatefulWidget {
  const ProductMainSection({super.key});

  @override
  State<ProductMainSection> createState() => _ProductMainSectionState();
}

class _ProductMainSectionState extends State<ProductMainSection> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          ProductHeaderWidget(),
          ProductPriceWidget(),
          ProductLowestPriceWidget(),
          SizedBox(
            height: 40,
          ),
          ProductOptionWidget(),
          Spacer(),
          SizedBox(height: 85, child: AddToCartWidget())
        ],
      ),
    );
  }
}
