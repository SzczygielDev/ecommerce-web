import 'package:flutter/material.dart';

class CheckboxCell extends StatelessWidget {
  const CheckboxCell({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            onChanged: (value) {},
            value: false,
          ),
        ),
      ),
    );
  }
}
