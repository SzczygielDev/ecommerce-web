import 'package:ecommerce_web/presentation/config/app_colors.dart';
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
              children: [
                Text(
                  'ECOMMERCE',
                  style: GoogleFonts.koulen(fontSize: 30),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
