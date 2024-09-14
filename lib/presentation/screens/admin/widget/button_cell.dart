import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
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
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(250, 40),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: AppTypography.medium1
                    .merge(const TextStyle(color: AppColors.main)),
              ),
            )),
      ),
    );
  }
}
