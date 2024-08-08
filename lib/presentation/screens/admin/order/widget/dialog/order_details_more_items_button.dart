import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsMoreItemsButton extends StatelessWidget {
  final Function() onPressed;
  const OrderDetailsMoreItemsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Pokaż więcej",
              style: TextStyle(fontSize: 22, color: AppColors.main),
            ),
          ),
        ],
      ),
    );
  }
}
