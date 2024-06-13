import 'package:flutter/material.dart';

class CatalogActiveFilterChip extends StatelessWidget {
  const CatalogActiveFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteIcon: const Icon(Icons.close),
      onDeleted: () {},
      label: const Padding(
        padding: EdgeInsets.only(right: 30),
        child: Text("Filtr A"),
      ),
      backgroundColor: Colors.white,
    );
  }
}
