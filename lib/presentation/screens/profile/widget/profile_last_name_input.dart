import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class ProfileLastNameInput extends StatefulWidget {
  final TextEditingController controller;
  const ProfileLastNameInput({super.key, required this.controller});

  @override
  State<ProfileLastNameInput> createState() => _ProfileLastNameInputState();
}

class _ProfileLastNameInputState extends State<ProfileLastNameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => NotEmptyValidator.validate(value),
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
