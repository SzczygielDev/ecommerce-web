import 'package:ecommerce_web/domain/order/order_item.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class OrderDetailsItem extends StatelessWidget {
  final OrderItem item;
  const OrderDetailsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.darkGrey,
            ),
          ),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    item.title,
                    style: AppTypography.medium3,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "${item.quantity}x",
                    style: AppTypography.medium1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${item.price.toStringAsFixed(2)} ZŁ",
                    style: AppTypography.medium3,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
