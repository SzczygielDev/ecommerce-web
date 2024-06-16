import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitCartButton extends StatelessWidget {
  final double total;
  const SubmitCartButton({super.key, required this.total});

  const SubmitCartButton.disabled({super.key}) : total = 0;

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
        onPressed: total == 0
            ? null
            : () {
                context.read<CartBloc>().add(CartSubmitEvent());
              },
        child: total == 0
            ? const Text("Zamawiam",
                style: TextStyle(color: Colors.black, fontSize: 20))
            : Text("Zamawiam    ${total.toStringAsFixed(2)} ZŁ",
                style: const TextStyle(color: Colors.black, fontSize: 20)));
  }
}
