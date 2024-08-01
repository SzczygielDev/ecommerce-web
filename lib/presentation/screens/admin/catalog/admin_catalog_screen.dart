import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
import 'package:flutter/material.dart';

class AdminCatalogScreen extends StatefulWidget {
  const AdminCatalogScreen({super.key});

  @override
  State<AdminCatalogScreen> createState() => _AdminCatalogScreenState();
}

class _AdminCatalogScreenState extends State<AdminCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScrollableGenericPage(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Catalog"),
          )
        ],
      ),
    ));
  }
}
