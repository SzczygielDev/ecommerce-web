import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CatalogEmptyCategoryPlaceholder extends StatelessWidget {
  const CatalogEmptyCategoryPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.grey,
        ),
        height: 600,
        child: const Center(child: Text("Brak produktów w wybranej kategorii")),
      ),
    );
  }
}
