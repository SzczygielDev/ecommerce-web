import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardStreetInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardStreetInput({super.key, required this.controller});

  @override
  State<OnboardStreetInput> createState() => _OnboardStreetInputState();
}

class _OnboardStreetInputState extends State<OnboardStreetInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Ulica",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
          )),
    );
  }
}
