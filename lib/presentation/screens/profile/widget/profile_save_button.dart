import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class ProfileSaveButton extends StatelessWidget {
  final Function()? onPressed;
  final bool working;

  const ProfileSaveButton(
      {super.key, required this.onPressed, required this.working});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size.fromHeight(48),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: working
              ? const CircularProgressIndicator()
              : Text("Zapisz",
                  style: AppTypography.medium1
                      .merge(const TextStyle(color: AppColors.main))),
        ));
  }
}
