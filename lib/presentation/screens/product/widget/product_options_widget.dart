import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOptionsWidget extends StatefulWidget {
  const ProductOptionsWidget({super.key});

  @override
  State<ProductOptionsWidget> createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state.loadingState) {
          case ProductLoadingState.loading:
          case ProductLoadingState.error:
            return Container(
              decoration: BoxDecoration(
                color: AppColors.shimmerGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 140,
              width: 300,
            );
          case ProductLoadingState.loaded:
            return const Column(
              children: [
                ProductOptionWidget(),
                SizedBox(
                  height: 15,
                ),
                ProductOptionWidget()
              ],
            );
        }
      },
    );
  }
}
