import 'package:ecommerce_web/domain/order/order_item.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsItem extends StatelessWidget {
  final OrderItem item;
  const OrderDetailsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 100,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              item.title,
              style: const TextStyle(fontSize: 26),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              "${item.quantity}x",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${item.price.toStringAsFixed(2)} ZŁ",
              style: const TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
