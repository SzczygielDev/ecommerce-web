import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/client_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartClientSection extends StatelessWidget {
  const CartClientSection({super.key});

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
                    "Twoje dane",
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
                  switch (state.loadingState) {
                    case CartLoadingState.error:
                    case CartLoadingState.loading:
                      return const SizedBox.shrink();
                    case CartLoadingState.loaded:
                      final clientData = state.clientData;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${clientData!.firstName} ${clientData.lastName}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            clientData.addressFirstLine,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            clientData.addressSecondLine,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            clientData.phoneNumber,
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      );
                  }
                },
              )
            ],
          ),
        ));
  }
}
