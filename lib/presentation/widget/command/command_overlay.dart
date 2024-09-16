import 'package:flutter/material.dart';

class CommandOverlay extends StatefulWidget {
  final List<Widget> children;
  const CommandOverlay({super.key, required this.children});

  @override
  State<CommandOverlay> createState() => _CommandOverlayState();
}

class _CommandOverlayState extends State<CommandOverlay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.children,
        const SizedBox(
          height: 128,
        )
      ],
    );
  }
}
