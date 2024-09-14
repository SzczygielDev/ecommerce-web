import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                switch (state.loadingState) {
                  case CartLoadingState.loading:
                  case CartLoadingState.error:
                    return const SizedBox.shrink();

                  case CartLoadingState.loaded:
                    final double cartTotal = state.cartTotal!;
                    final double deliveryPrice = 0;
                    final double specialOfferPrice = 0;
                    final double finalPrice = state.cartTotal!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Koszyk: ${cartTotal.toStringAsFixed(2)} ZŁ",
                          style: AppTypography.small1,
                        ),
                        Text(
                          "Dostawa ${deliveryPrice.toStringAsFixed(2)} ZŁ",
                          style: AppTypography.small1,
                        ),
                        Text(
                          "Kod promocyjny ${specialOfferPrice.toStringAsFixed(2)} ZŁ",
                          style: AppTypography.small1,
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CAŁOŚĆ",
                              style: AppTypography.medium3.merge(
                                  const TextStyle(color: AppColors.main)),
                            ),
                            Text(
                              "${finalPrice.toStringAsFixed(2)} ZŁ",
                              style: AppTypography.medium3.merge(
                                  const TextStyle(color: AppColors.main)),
                            ),
                          ],
                        ),
                      ],
                    );
                }
              },
            )));
  }
}
