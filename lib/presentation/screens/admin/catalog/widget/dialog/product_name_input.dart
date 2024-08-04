import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class ProductNameInput extends StatefulWidget {
  final TextEditingController controller;
  const ProductNameInput({super.key, required this.controller});

  @override
  State<ProductNameInput> createState() => _ProductNameInputState();
}

class _ProductNameInputState extends State<ProductNameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => NotEmptyValidator.validate(value),
      style: const TextStyle(fontSize: 24),
      decoration: const InputDecoration(
          hintText: "Nazwa", hintStyle: TextStyle(fontSize: 24)),
    );
  }
}
