import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';

class OrderCancelButton extends StatelessWidget {
  final Function() onPressed;
  const OrderCancelButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      title: "Anuluj zamówienie",
      onPressed: onPressed,
      size: const Size(250, 40),
    );
  }
}
