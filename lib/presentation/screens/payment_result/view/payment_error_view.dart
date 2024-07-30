import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/gestures.dart';
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
              color: Color.fromARGB(255, 225, 88, 88),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Wystąpił problem podczas płatności, spróbuj ponownie. W przypadku dodatkowych problemów, skontaktuj się z nami poprzez infolinię, dzwoniąc pod numer +48 123456789, lub mailowo, opisując w wiadomości problem pod adres kontakt@example.com.",
          style: TextStyle(fontSize: 32),
        ),
        const Text(
          "Zespół ECOMMERCE",
          style: TextStyle(fontSize: 32),
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
                    style: TextStyle(fontSize: 30),
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
                  child: const Text(
                    "Spróbuj ponownie",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
