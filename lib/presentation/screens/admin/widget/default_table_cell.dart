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
        padding: const EdgeInsets.fromLTRB(10, 27, 0, 27),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: bold ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
