import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartSubmitSuccessDialog extends StatefulWidget {
  const CartSubmitSuccessDialog({super.key});

  @override
  State<CartSubmitSuccessDialog> createState() =>
      _CartSubmitSuccessDialogState();
}

class _CartSubmitSuccessDialogState extends State<CartSubmitSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    color: Color.fromARGB(255, 132, 221, 153),
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
                  const TextSpan(
                      text: ". Dziękujemy za zakupy w naszym sklepie.")
                ]),
                style: const TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
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
                          "Kontynuuj zakupy",
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
                          context.go('/orders');
                        },
                        child: const Text(
                          "Przejdź do zamówień",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
