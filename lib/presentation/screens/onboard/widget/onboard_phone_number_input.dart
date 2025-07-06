import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardPhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardPhoneNumberInput({super.key, required this.controller});

  @override
  State<OnboardPhoneNumberInput> createState() =>
      _OnboardPhoneNumberInputState();
}

class _OnboardPhoneNumberInputState extends State<OnboardPhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Numer telefonu",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
