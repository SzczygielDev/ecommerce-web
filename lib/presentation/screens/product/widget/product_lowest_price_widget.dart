import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLowestPriceWidget extends StatefulWidget {
  const ProductLowestPriceWidget({super.key});

  @override
  State<ProductLowestPriceWidget> createState() =>
      _ProductLowestPriceWidgetState();
}

class _ProductLowestPriceWidgetState extends State<ProductLowestPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state.loadingState) {
            case ProductLoadingState.loading:
            case ProductLoadingState.error:
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 20,
                width: 260,
              );
            case ProductLoadingState.loaded:
              return Text(
                "Najniższa cena z ostatnich 30 dni - ${state.product!.price}",
                style: AppTypography.xsmall2,
              );
          }
        },
      ),
    );
  }
}
