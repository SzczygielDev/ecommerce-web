import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/admin_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.go(AdminDashboardScreen.route);
                      },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: InkWell(
                        onTap: () {
                          context.go("/");
                        },
                        child: const Text(
                          '>> Strefa klienta <<',
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          context
                              .read<AuthenticationBloc>()
                              .add(LogOutRequestEvent());
                        },
                        icon: const Icon(Icons.logout)),
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
