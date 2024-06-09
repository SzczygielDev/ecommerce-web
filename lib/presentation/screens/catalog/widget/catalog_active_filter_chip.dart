import 'package:flutter/material.dart';

class CatalogActiveFilterChip extends StatelessWidget {
  const CatalogActiveFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text("Filtr A"),
      backgroundColor: Colors.white,
    );
  }
}
