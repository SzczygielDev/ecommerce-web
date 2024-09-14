import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_payment_service_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPaymentSection extends StatelessWidget {
  const CartPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Płatność",
                style: AppTypography.medium2,
              ),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  switch (state.loadingState) {
                    case CartLoadingState.loading:
                    case CartLoadingState.error:
                      return const SizedBox.shrink();
                    case CartLoadingState.loaded:
                      return Column(
                        children: state.paymentProviders.map((provider) {
                          final bool selected =
                              provider == state.selectedPaymentProvider;
                          return CartPaymentServiceProviderWidget(
                              provider: provider, selected: selected);
                        }).toList(),
                      );
                  }
                },
              )
            ],
          ),
        ));
  }
}
