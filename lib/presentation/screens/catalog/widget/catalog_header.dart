import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              "Polecane",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Kategoria A > Kategoria B > Kategoria C",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.black,
          height: 1,
        )
      ],
    );
  }
}
