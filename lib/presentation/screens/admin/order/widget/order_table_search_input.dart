import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderTableSearchInput extends StatefulWidget {
  const OrderTableSearchInput({super.key});

  @override
  State<OrderTableSearchInput> createState() => _OrderTableSearchInputState();
}

class _OrderTableSearchInputState extends State<OrderTableSearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          hintText: "Wyszukaj",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
