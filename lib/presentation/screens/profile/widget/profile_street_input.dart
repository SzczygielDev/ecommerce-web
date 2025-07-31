import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class ProfileStreetInput extends StatefulWidget {
  final TextEditingController controller;
  const ProfileStreetInput({super.key, required this.controller});

  @override
  State<ProfileStreetInput> createState() => _ProfileStreetInputState();
}

class _ProfileStreetInputState extends State<ProfileStreetInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => NotEmptyValidator.validate(value),
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
