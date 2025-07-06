import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardNameInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardNameInput({super.key, required this.controller});

  @override
  State<OnboardNameInput> createState() => _OnboardNameInputState();
}

class _OnboardNameInputState extends State<OnboardNameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Imie",
          hintStyle: AppTypography.small1,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
