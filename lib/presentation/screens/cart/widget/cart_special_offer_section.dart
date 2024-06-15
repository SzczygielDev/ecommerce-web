import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartSpecialOfferSection extends StatelessWidget {
  const CartSpecialOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kod promocyjny",
                style: TextStyle(fontSize: 22),
              ),
              Divider(),
              Text(
                "Punkt odbioru WAW23",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ));
  }
}
