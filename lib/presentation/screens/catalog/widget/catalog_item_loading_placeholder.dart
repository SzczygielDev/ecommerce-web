import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/widget/shimmer_decorator.dart';
import 'package:flutter/material.dart';

class CatalogItemLoadingPlaceholder extends StatelessWidget {
  const CatalogItemLoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.23,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerDecorator(
                child: Stack(
              children: [
                Container(
                  height: 600,
                  color: AppColors.grey,
                ),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.shimmerGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.shimmerGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
