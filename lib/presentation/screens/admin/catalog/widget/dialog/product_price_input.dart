import 'package:ecommerce_web/presentation/util/form/formatter/decimal_formatter.dart';
import 'package:ecommerce_web/presentation/util/form/validators/decimal_validator.dart';
import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class ProductPriceInput extends StatefulWidget {
  final TextEditingController controller;
  const ProductPriceInput({super.key, required this.controller});

  @override
  State<ProductPriceInput> createState() => _ProductPriceInputState();
}

class _ProductPriceInputState extends State<ProductPriceInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [DecimalFormatter()],
      validator: (value) {
        final notEmpty = NotEmptyValidator.validate(value);
        if (notEmpty != null) {
          return notEmpty;
        }

        final isDouble = DecimalValidator.validate(value);
        if (isDouble != null) {
          return isDouble;
        }

        return null;
      },
      style: const TextStyle(fontSize: 24),
      decoration: const InputDecoration(
          suffixText: "ZŁ",
          hintText: "Cena",
          hintStyle: TextStyle(fontSize: 24)),
    );
  }
}
