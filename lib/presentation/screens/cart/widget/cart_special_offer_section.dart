import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartSpecialOfferSection extends StatelessWidget {
  const CartSpecialOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kod promocyjny",
                style: TextStyle(fontSize: 22),
              ),
              const Divider(),
              TextFormField(
                decoration: const InputDecoration(),
              )
            ],
          ),
        ));
  }
}
