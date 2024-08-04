import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class ProductDescriptionInput extends StatefulWidget {
  final TextEditingController controller;
  const ProductDescriptionInput({super.key, required this.controller});

  @override
  State<ProductDescriptionInput> createState() =>
      _ProductDescriptionInputState();
}

class _ProductDescriptionInputState extends State<ProductDescriptionInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => NotEmptyValidator.validate(value),
      style: const TextStyle(fontSize: 24),
      decoration: const InputDecoration(
          hintText: "Opis", hintStyle: TextStyle(fontSize: 24)),
      maxLines: 10,
    );
  }
}
