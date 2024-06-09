import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CatalogItemWidget extends StatelessWidget {
  const CatalogItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 600,
              color: Colors.grey,
            ),
            Text(
              "Produkt A",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "199 PLN",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
