import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';

class ButtonCell extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const ButtonCell({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GenericButton(
          onPressed: onPressed,
          title: title,
          size: const Size(250, 40),
        ),
      ),
    );
  }
}
