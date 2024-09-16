import 'package:ecommerce_web/domain/product/product_price_change.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/util/date/default_date_time_format.dart';
import 'package:flutter/material.dart';

class ProductPriceHistoryItem extends StatelessWidget {
  final ProductPriceChange priceChange;
  const ProductPriceHistoryItem({super.key, required this.priceChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Nowa cena: ${priceChange.newPrice.toStringAsFixed(2)} ZŁ",
        style: AppTypography.small2,
      ),
      trailing: Text(
        DefaultDateTimeFormat().format(priceChange.timestamp),
        style: AppTypography.small2,
      ),
    );
  }
}
