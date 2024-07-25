import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_delivery_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartDeliverySection extends StatefulWidget {
  const CartDeliverySection({super.key});

  @override
  State<CartDeliverySection> createState() => _CartDeliverySectionState();
}

class _CartDeliverySectionState extends State<CartDeliverySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dostawa",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
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
                        children: state.deliveryProviders.map((provider) {
                          final bool selected =
                              provider == state.selectedDeliveryProvider;
                          return CartDeliveryProviderWidget(
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
