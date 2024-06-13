import 'package:flutter/material.dart';

class CatalogSideSection extends StatelessWidget {
  const CatalogSideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child:
                  const Text("Filtruj", style: TextStyle(color: Colors.black)))
        ],
      ),
    );
  }
}
