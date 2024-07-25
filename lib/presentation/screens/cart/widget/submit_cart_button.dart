import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitCartButton extends StatelessWidget {
  final bool enabled;
  final double total;
  const SubmitCartButton(
      {super.key, required this.total, required this.enabled});

  const SubmitCartButton.disabled({super.key})
      : total = 0,
        enabled = false;

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
        onPressed: enabled
            ? () {
                context.read<CartBloc>().add(CartSubmitEvent());
              }
            : null,
        child: total == 0
            ? const Text("Zamawiam",
                style: TextStyle(color: AppColors.main, fontSize: 20))
            : Text("Zamawiam    ${total.toStringAsFixed(2)} ZŁ",
                style: const TextStyle(color: AppColors.main, fontSize: 20)));
  }
}
