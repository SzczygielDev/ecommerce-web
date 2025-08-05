import 'package:ecommerce_web/domain/client/account_type.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailsView extends StatelessWidget {
  final Function() editProfilePressed;
  final Client client;
  const ProfileDetailsView(
      {super.key, required this.client, required this.editProfilePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      client.name,
                      style: AppTypography.medium1,
                    ),
                    Text(
                      client.lastName,
                      style: AppTypography.medium1,
                    ),
                    Text(
                      client.email,
                      style: AppTypography.medium1,
                    ),
                    Text(
                      client.phone,
                      style: AppTypography.medium1,
                    ),
                    Text(
                      "${client.zipCode} ${client.city}",
                      style: AppTypography.medium1,
                    ),
                    Text(
                      "${client.street} ${client.houseNumber}",
                      style: AppTypography.medium1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GenericButton(
                        onPressed: editProfilePressed, title: "Edytuj"),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.lightGrey,
                  child: client.accountType == AccountType.premium
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Konto premium aktywne!",
                              style: AppTypography.medium2,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            GenericButton(
                                onPressed: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(DeactivatePremiumAccountEvent());
                                },
                                title: "Deaktywuj konto premium")
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Aktywuj konto premium",
                              style: AppTypography.large1,
                            ),
                            const Text(
                                "Zacznij oszczędzać na przesyłkach już dzisiaj"),
                            const SizedBox(
                              height: 12,
                            ),
                            GenericButton(
                                onPressed: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(ActivatePremiumAccountEvent());
                                },
                                title: "Aktywuj konto premium")
                          ],
                        ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
