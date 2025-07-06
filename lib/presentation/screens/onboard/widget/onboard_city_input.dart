import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardCityInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardCityInput({super.key, required this.controller});

  @override
  State<OnboardCityInput> createState() => _OnboardCityInputState();
}

class _OnboardCityInputState extends State<OnboardCityInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Miasto",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
