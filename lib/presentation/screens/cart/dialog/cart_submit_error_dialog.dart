import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartSubmitErrorDialog extends StatefulWidget {
  const CartSubmitErrorDialog({super.key});

  @override
  State<CartSubmitErrorDialog> createState() => _CartSubmitErrorDialogState();
}

class _CartSubmitErrorDialogState extends State<CartSubmitErrorDialog> {
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
                          Navigator.of(context).pop();
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
                        onPressed: () {},
                        child: const Text(
                          "Spróbuj ponownie",
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
