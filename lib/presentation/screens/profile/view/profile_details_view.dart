import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';

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
        Column(
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
            GenericButton(onPressed: editProfilePressed, title: "Edytuj"),
          ],
        )
      ],
    );
  }
}
