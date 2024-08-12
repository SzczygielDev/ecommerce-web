import 'package:ecommerce_web/presentation/util/form/formatter/decimal_formatter.dart';
import 'package:ecommerce_web/presentation/util/form/validators/decimal_validator.dart';
import 'package:ecommerce_web/presentation/util/form/validators/not_empty_validator.dart';
import 'package:flutter/material.dart';

class OrderDimensionInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String suffixText;
  const OrderDimensionInput(
      {super.key,
      required this.title,
      required this.controller,
      required this.suffixText});

  @override
  State<OrderDimensionInput> createState() => _OrderDimensionInputState();
}

class _OrderDimensionInputState extends State<OrderDimensionInput> {
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
      style: const TextStyle(fontSize: 22),
      decoration: InputDecoration(
          hintText: widget.title, suffixText: widget.suffixText),
    );
  }
}
