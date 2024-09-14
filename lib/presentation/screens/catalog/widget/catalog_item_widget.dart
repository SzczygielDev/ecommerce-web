import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class CatalogItemWidget extends StatelessWidget {
  final Product product;
  final Function() onTapped;
  const CatalogItemWidget(
      {super.key, required this.product, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 600,
                  color: AppColors.grey,
                ),
                Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: AppColors.lightGrey,
                        onTap: onTapped,
                      )),
                ),
              ],
            ),
            InkWell(
              onTap: onTapped,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTypography.medium1,
                  ),
                  Text(
                    "${product.price} PLN",
                    style: AppTypography.medium1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
