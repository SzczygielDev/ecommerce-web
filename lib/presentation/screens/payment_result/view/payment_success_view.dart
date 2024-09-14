import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

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
              "Zamówienie opłacone!",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.done,
              size: 80,
              color: AppColors.green,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Text.rich(
          TextSpan(children: [
            const TextSpan(
                text:
                    "Paczka już niebawem dotrze do Ciebie. Szczegóły i status zamówienia znajdziesz w zakładce "),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.go('/orders'),
                text: "moje zamówienia",
                style: const TextStyle(
                    color: AppColors.main,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.main)),
            const TextSpan(text: ". Dziękujemy za zakupy w naszym sklepie.")
          ]),
          style: AppTypography.xlarge1,
          textAlign: TextAlign.center,
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
                    "Kontynuuj zakupy",
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
                    context.go('/orders');
                  },
                  child: Text(
                    "Przejdź do zamówień",
                    style: AppTypography.large2
                        .merge(const TextStyle(color: Colors.white)),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
