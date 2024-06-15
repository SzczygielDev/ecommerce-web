import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/add_to_cart_button.dart';
import 'package:ecommerce_web/presentation/screens/product/widget/product_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMainSection extends StatelessWidget {
  const ProductMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  switch (state) {
                    case ProductLoadingState():
                    case ProductLoadingErrorState():
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.shimmerGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 36,
                        width: 300,
                      );
                    case ProductLoadedState():
                      return Text(
                        state.product.title,
                        style: const TextStyle(fontSize: 36),
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
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              switch (state) {
                case ProductLoadingState():
                case ProductLoadingErrorState():
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.shimmerGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 32,
                    width: 150,
                  );
                case ProductLoadedState():
                  return Text(
                    "${state.product!.price} PLN",
                    style: const TextStyle(fontSize: 32),
                  );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                switch (state) {
                  case ProductLoadingState():
                  case ProductLoadingErrorState():
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.shimmerGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 20,
                      width: 260,
                    );
                  case ProductLoadedState():
                    return Text(
                      "Najniższa cena z ostatnich 30 dni - ${state.product.price}",
                      style: const TextStyle(fontSize: 14),
                    );
                }
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              switch (state) {
                case ProductLoadingState():
                case ProductLoadingErrorState():
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.shimmerGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 140,
                    width: 300,
                  );
                case ProductLoadedState():
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
          ),
          const Spacer(),
          const FractionallySizedBox(
            widthFactor: 0.8,
            child: AddToCartButton(),
          )
        ],
      ),
    );
  }
}
