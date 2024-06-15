import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Koszyk: 200.0 ZŁ",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Dostawa 20.0 ZŁ",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Kod promocyjny -70.0 ZŁ",
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CAŁOŚĆ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "150.0 ZŁ",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
