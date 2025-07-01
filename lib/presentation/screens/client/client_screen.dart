import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientScreen extends StatefulWidget {
  static const route = "/client";
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return GenericPage(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          switch (state) {
            case UnauthenticatedState():
              return const Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Center(
                          child: Text("Zaloguj się, aby zobaczyć swoje dane.")))
                ],
              );
            case AuthenticatedState():
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Container(
                    color: AppColors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Twoje dane",
                            style: AppTypography.large1,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            state.user.name,
                            style: AppTypography.medium1,
                          ),
                          Text(
                            state.user.surname,
                            style: AppTypography.medium1,
                          ),
                          Text(
                            state.user.email,
                            style: AppTypography.medium1,
                          ),
                          const Spacer(),
                          GenericButton(
                              onPressed: () {
                                launchUrl(AppConsts.accountUri);
                              },
                              title: "Edytuj profil")
                        ],
                      ),
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
