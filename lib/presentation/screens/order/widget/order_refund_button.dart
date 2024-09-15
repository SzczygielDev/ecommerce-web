import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';

class OrderRefundButton extends StatelessWidget {
  const OrderRefundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      onPressed: () {},
      title: "Zwróć zamówienie",
      size: const Size(250, 40),
    );
  }
}
