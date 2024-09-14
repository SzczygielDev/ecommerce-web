import 'package:ecommerce_web/domain/order/order_item.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_details_item.dart';
import 'package:flutter/material.dart';

class OrderItemsDialog extends StatefulWidget {
  final List<OrderItem> items;
  const OrderItemsDialog({super.key, required this.items});

  @override
  State<OrderItemsDialog> createState() => _OrderItemsDialogState();
}

class _OrderItemsDialogState extends State<OrderItemsDialog> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Lista produktów",
                  style: AppTypography.xlarge1,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...widget.items.map((e) => SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: OrderDetailsItem(item: e)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
