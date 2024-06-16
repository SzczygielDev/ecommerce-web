import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  Text(
                    "zmień",
                    style: TextStyle(
                        fontSize: 22, decoration: TextDecoration.underline),
                  )
                ],
              ),
              const Divider(),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  switch (state) {
                    case CartLoadedState():
                      return Text(
                        state.deliveryData.value,
                        style: const TextStyle(fontSize: 16),
                      );
                    case CartLoadingState():
                    case CartErrorState():
                      return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ));
  }
}
