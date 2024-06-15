import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                InkWell(
                  onTap: () {
                    context.pushReplacement('/');
                  },
                  child: Text(
                    'ECOMMERCE',
                    style: GoogleFonts.koulen(fontSize: 62),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          context.go('/cart');
                        },
                        child: Text("koszyk")),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 100,
                    ),
                    InkWell(
                        onTap: () {
                          context.go('/cart');
                        },
                        child: Text("zaloguj się")),
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
