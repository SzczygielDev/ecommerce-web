import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          child: const Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text("Polecane", style: AppTypography.xlarge1),
              SizedBox(
                width: 30,
              ),
              Text(
                "Kategoria A > Kategoria B > Kategoria C",
                style: AppTypography.xsmall2,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Colors.black,
          height: 1,
        )
      ],
    );
  }
}
