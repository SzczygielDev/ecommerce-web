import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class OnboardEmailInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardEmailInput({super.key, required this.controller});

  @override
  State<OnboardEmailInput> createState() => _OnboardEmailInputState();
}

class _OnboardEmailInputState extends State<OnboardEmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      controller: widget.controller,
      validator: (value) => NotEmptyValidator.validate(value),
      decoration: const InputDecoration(
          hintText: "Email",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
