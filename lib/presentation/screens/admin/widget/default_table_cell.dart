import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class DefaultTableCell extends StatelessWidget {
  final String title;
  final bool bold;
  const DefaultTableCell({super.key, required this.title, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 27, 10, 27),
        child: Text(
          title,
          style: AppTypography.medium1
              .merge(TextStyle(fontWeight: bold ? FontWeight.bold : null)),
        ),
      ),
    );
  }
}
