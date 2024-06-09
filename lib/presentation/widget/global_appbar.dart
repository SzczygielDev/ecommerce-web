import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar({super.key, required BuildContext context})
      : super(
          toolbarHeight: 100,
          backgroundColor: AppColors.grey,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ECOMMERCE',
                  style: GoogleFonts.koulen(fontSize: 62),
                ),
                Row(
                  children: [
                    const Text("koszyk"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 100,
                    ),
                    const Text("zaloguj się"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 100,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
}
