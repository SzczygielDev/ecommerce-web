import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardLastNameInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardLastNameInput({super.key, required this.controller});

  @override
  State<OnboardLastNameInput> createState() => _OnboardLastNameInputState();
}

class _OnboardLastNameInputState extends State<OnboardLastNameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Naziwsko",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
