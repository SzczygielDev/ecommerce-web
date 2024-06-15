import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class ProductPhotoSection extends StatelessWidget {
  const ProductPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              color: AppColors.shimmerGrey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            color: AppColors.shimmerGrey,
            child: const Center(
              child: Text("Galeria"),
            ),
          ),
        ],
      ),
    );
  }
}
