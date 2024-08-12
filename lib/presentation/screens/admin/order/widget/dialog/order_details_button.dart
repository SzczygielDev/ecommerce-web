import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsButton extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  const OrderDetailsButton(
      {super.key, required this.title, required this.onPressed});

  @override
  State<OrderDetailsButton> createState() => _OrderDetailsButtonState();
}

class _OrderDetailsButtonState extends State<OrderDetailsButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size.fromHeight(80),
        ),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.title,
              style: const TextStyle(color: AppColors.main, fontSize: 20)),
        ));
  }
}
