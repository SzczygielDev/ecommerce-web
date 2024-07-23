import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderRefundButton extends StatelessWidget {
  const OrderRefundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(250, 40),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text("Zwróć zamówienie",
              style: TextStyle(color: AppColors.main, fontSize: 20)),
        ));
  }
}