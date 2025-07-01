import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce_web/presentation/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar(
      {super.key, required BuildContext context, required UserInfo? user})
      : super(
          toolbarHeight: kToolbarHeight * 1.4,
          backgroundColor: AppColors.grey,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.go('/');
                  },
                  child: Text(
                    'ECOMMERCE',
                    style:
                        GoogleFonts.koulen(fontSize: 62, color: AppColors.main),
                  ),
                ),
                user != null
                    ? Row(
                        children: [
                          InkWell(
                              onTap: () {
                                context.go(CartScreen.route);
                              },
                              child: const Text("koszyk")),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100,
                          ),
                          InkWell(
                              onTap: () {
                                context.go(OrderScreen.route);
                              },
                              child: const Text("zamówienia")),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100,
                          ),
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
                    : Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(SignInEvent());
                              },
                              icon: const Icon(Icons.login))
                        ],
                      )
              ],
            ),
          ),
        );
}
