import 'package:flutter/material.dart';

class CheckboxCell extends StatefulWidget {
  final Function(bool value) callback;
  final bool value;
  const CheckboxCell({super.key, required this.callback, required this.value});

  @override
  State<CheckboxCell> createState() => _CheckboxCellState();
}

class _CheckboxCellState extends State<CheckboxCell> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            onChanged: (value) {
              setState(() {
                widget.callback(value ?? false);
              });
            },
            value: widget.value,
          ),
        ),
      ),
    );
  }
}
