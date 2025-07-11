import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/form/formatter/zip_code_formatter.dart';
import 'package:flutter/material.dart';

class OnboardZipCodeInput extends StatefulWidget {
  final TextEditingController controller;
  const OnboardZipCodeInput({super.key, required this.controller});

  @override
  State<OnboardZipCodeInput> createState() => _OnboardZipCodeInputState();
}

class _OnboardZipCodeInputState extends State<OnboardZipCodeInput> {
  final _formatter = ZipCodeFormatter();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (_formatter.getUnmaskedText().length != 5) {
          return "Podaj poprawny kod pocztowy";
        }

        return null;
      },
      inputFormatters: [_formatter],
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
