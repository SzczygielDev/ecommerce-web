import 'package:flutter/material.dart';

class WidgetTableCell extends StatefulWidget {
  final Widget child;
  const WidgetTableCell({super.key, required this.child});

  @override
  State<WidgetTableCell> createState() => _WidgetTableCellState();
}

class _WidgetTableCellState extends State<WidgetTableCell> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 27, 10, 27),
        child: widget.child,
      ),
    );
  }
}
