import 'package:flutter/material.dart';

class AdminSideDialog extends StatelessWidget {
  final Widget child;
  const AdminSideDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24), topLeft: Radius.circular(24)),
          ),
          insetPadding: EdgeInsets.zero,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Padding(padding: const EdgeInsets.all(40), child: child),
          ),
        ),
      ],
    );
  }
}
