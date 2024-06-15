import 'package:flutter/material.dart';

class SubmitCartButton extends StatelessWidget {
  const SubmitCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size.fromHeight(80),
        ),
        onPressed: () {},
        child: const Text("Zamawiam    150.0 ZŁ",
            style: TextStyle(color: Colors.black, fontSize: 20)));
  }
}
