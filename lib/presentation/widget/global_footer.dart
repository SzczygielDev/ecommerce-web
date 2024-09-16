import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalFooter extends StatelessWidget {
  const GlobalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ECOMMERCE',
                  style: AppTypography.large2
                      .merge(GoogleFonts.koulen(color: AppColors.main)),
                ),
                const Text(
                  'Strona główna',
                  style: AppTypography.small1,
                ),
                const Text(
                  'Polityka prywatności',
                  style: AppTypography.small1,
                ),
                const Text(
                  'Regulamin',
                  style: AppTypography.small1,
                ),
                const Text(
                  'Dostawy',
                  style: AppTypography.small1,
                ),
                const Text(
                  'O nas',
                  style: AppTypography.small1,
                ),
                const Text(
                  'Kontakt',
                  style: AppTypography.small1,
                ),
              ].map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: e,
                  );
                },
              ).toList(),
            ),
          ),
        )
      ],
    );
  }
}
