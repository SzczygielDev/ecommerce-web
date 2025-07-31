import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/form/formatter/zip_code_formatter.dart';
import 'package:flutter/material.dart';

class ProfileZipCodeInput extends StatefulWidget {
  final TextEditingController controller;
  const ProfileZipCodeInput({super.key, required this.controller});

  @override
  State<ProfileZipCodeInput> createState() => _ProfileZipCodeInputState();
}

class _ProfileZipCodeInputState extends State<ProfileZipCodeInput> {
  late final _formatter = ZipCodeFormatter(initialText: widget.controller.text);
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
