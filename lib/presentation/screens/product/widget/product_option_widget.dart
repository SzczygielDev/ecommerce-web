import 'package:flutter/material.dart';

class ProductOptionWidget extends StatelessWidget {
  const ProductOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: "Opcja A",
              items: const [
                DropdownMenuItem<String>(
                  value: "Opcja A",
                  child: Text("Opcja A"),
                )
              ],
              onChanged: (value) {}),
        ),
      ),
    );
  }
}
