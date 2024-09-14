import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class OrderDetailsMoreItemsButton extends StatelessWidget {
  final Function() onPressed;
  const OrderDetailsMoreItemsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Pokaż więcej",
              style: AppTypography.medium2
                  .merge(const TextStyle(color: AppColors.main)),
            ),
          ),
        ],
      ),
    );
  }
}
