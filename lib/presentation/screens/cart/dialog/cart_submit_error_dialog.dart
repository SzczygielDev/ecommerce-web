import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class CartSubmitErrorDialog extends StatefulWidget {
  const CartSubmitErrorDialog({super.key});

  @override
  State<CartSubmitErrorDialog> createState() => _CartSubmitErrorDialogState();
}

class _CartSubmitErrorDialogState extends State<CartSubmitErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Błąd",
              style: AppTypography.xlarge1,
            ),
            Text(
              "Wystąpił problem podczas finalizacji zamówienia, spróbuj ponownie później.",
              style: AppTypography.large1,
            )
          ],
        ),
      ),
    );
  }
}
