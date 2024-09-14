import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceWidget extends StatefulWidget {
  const ProductPriceWidget({super.key});

  @override
  State<ProductPriceWidget> createState() => _ProductPriceWidgetState();
}

class _ProductPriceWidgetState extends State<ProductPriceWidget> {
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
              height: 32,
              width: 150,
            );
          case ProductLoadingState.loaded:
            return Text(
              "${state.product!.price} PLN",
              style: AppTypography.xlarge1,
            );
        }
      },
    );
  }
}
