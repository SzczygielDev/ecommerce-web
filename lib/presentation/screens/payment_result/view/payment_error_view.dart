import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

class PaymentErrorView extends StatelessWidget {
  final String paymentUrl;
  const PaymentErrorView({super.key, required this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Problem z płatnością",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.error_outline,
              size: 80,
              color: AppColors.red,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Wystąpił problem podczas płatności, spróbuj ponownie. W przypadku dodatkowych problemów, skontaktuj się z nami poprzez infolinię, dzwoniąc pod numer +48 123456789, lub mailowo, opisując w wiadomości problem pod adres kontakt@example.com.",
          style: AppTypography.xlarge1,
        ),
        const Text(
          "Zespół ECOMMERCE",
          style: AppTypography.xlarge1,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(80),
                  ),
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text(
                    "Anuluj",
                    style: AppTypography.large2,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.main,
                    minimumSize: const Size.fromHeight(80),
                  ),
                  onPressed: () {
                    html.window.open(paymentUrl, '_self');
                  },
                  child: Text(
                    "Spróbuj ponownie",
                    style: AppTypography.large2
                        .merge(const TextStyle(color: Colors.white)),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
