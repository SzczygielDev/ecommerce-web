import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_active_filter_chip.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_item_widget.dart';
import 'package:flutter/material.dart';

class CatalogMainSection extends StatelessWidget {
  const CatalogMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CatalogActiveFilterChip(),
              CatalogActiveFilterChip(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CatalogItemWidget(),
              CatalogItemWidget(),
              CatalogItemWidget(),
              CatalogItemWidget()
            ],
          )
        ],
      ),
    );
  }
}
