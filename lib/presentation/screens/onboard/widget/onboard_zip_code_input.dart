import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardZipCodeInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardZipCodeInput({super.key, required this.controller});

  @override
  State<OnboardZipCodeInput> createState() => _OnboardZipCodeInputState();
}

class _OnboardZipCodeInputState extends State<OnboardZipCodeInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Kod pocztowy",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
