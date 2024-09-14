import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductHeaderWidget extends StatefulWidget {
  const ProductHeaderWidget({super.key});

  @override
  State<ProductHeaderWidget> createState() => _ProductHeaderWidgetState();
}

class _ProductHeaderWidgetState extends State<ProductHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            switch (state.loadingState) {
              case ProductLoadingState.loading:
              case ProductLoadingState.error:
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.shimmerGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 36,
                  width: 300,
                );

              case ProductLoadingState.loaded:
                return Text(
                  state.product!.title,
                  style: AppTypography.xlarge2,
                );
            }
          },
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 36,
            ))
      ],
    );
  }
}
