import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/widget/shimmer_decorator.dart';
import 'package:flutter/material.dart';

class OrderLoadingView extends StatefulWidget {
  const OrderLoadingView({super.key});

  @override
  State<OrderLoadingView> createState() => _OrderLoadingViewState();
}

class _OrderLoadingViewState extends State<OrderLoadingView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ShimmerDecorator(
              child: Container(
                color: AppColors.shimmerGrey,
                height: 200,
              ),
            ),
          ),
        )
      ],
    );
  }
}
