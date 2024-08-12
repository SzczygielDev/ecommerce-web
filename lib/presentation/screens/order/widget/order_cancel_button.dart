import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderCancelButton extends StatelessWidget {
  final Function() onPressed;
  const OrderCancelButton({super.key, required this.onPressed});

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
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Anuluj zamówienie",
              style: TextStyle(color: AppColors.main, fontSize: 20)),
        ));
    ;
  }
}
