import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAppBar extends AppBar {
  AdminAppBar({super.key, required BuildContext context})
      : super(
          toolbarHeight: 100,
          backgroundColor: AppColors.grey,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                          text: 'ECOMMERCE ',
                          style: TextStyle(color: AppColors.main)),
                      TextSpan(
                          text: 'ADMIN',
                          style: TextStyle(color: AppColors.lightMain))
                    ]),
                    style: GoogleFonts.koulen(fontSize: 62),
                  ),
                ),
                Row(
                  children: [
                    InkWell(onTap: () {}, child: const Text("wyloguj się")),
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
