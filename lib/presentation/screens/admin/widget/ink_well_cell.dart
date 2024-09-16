import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class InkWellCell extends StatelessWidget {
  final String title;
  final bool bold;
  final Function() onPressed;
  const InkWellCell(
      {super.key,
      required this.title,
      this.bold = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TableRowInkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 27, 10, 27),
          child: Text(
            title,
            style: AppTypography.medium1
                .merge(TextStyle(fontWeight: bold ? FontWeight.bold : null)),
          ),
        ),
      ),
    );
  }
}
