import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardHouseNumberInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardHouseNumberInput({super.key, required this.controller});

  @override
  State<OnboardHouseNumberInput> createState() =>
      _OnboardHouseNumberInputState();
}

class _OnboardHouseNumberInputState extends State<OnboardHouseNumberInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Numer",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
