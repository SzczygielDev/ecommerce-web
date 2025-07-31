import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class EditProfileFormMessage extends StatelessWidget {
  final String text;
  final Color color;
  const EditProfileFormMessage(
      {super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: AppTypography.medium1
                .merge(const TextStyle(color: Colors.white)),
          ),
        ));
  }
}
