import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_dimensions_dialog_result.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_details_button.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_dimension_input.dart';
import 'package:flutter/material.dart';

class OrderDimensionsDialog extends StatefulWidget {
  const OrderDimensionsDialog({super.key});

  @override
  State<OrderDimensionsDialog> createState() => _OrderDimensionsDialogState();
}

class _OrderDimensionsDialogState extends State<OrderDimensionsDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FractionallySizedBox(
        widthFactor: 0.4,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Podaj wymiary paczki",
                    style: AppTypography.large2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OrderDimensionInput(
                    suffixText: "mm",
                    controller: widthController,
                    title: "Szerokość (w milimetrach)",
                  ),
                  OrderDimensionInput(
                    suffixText: "mm",
                    controller: heightController,
                    title: "Wysokość (w milimetrach)",
                  ),
                  OrderDimensionInput(
                    suffixText: "mm",
                    controller: lengthController,
                    title: "Długość (w milimetrach)",
                  ),
                  OrderDimensionInput(
                    suffixText: "g",
                    controller: weightController,
                    title: "Waga (w gramach)",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OrderDetailsButton(
                    title: "Zatwierdź",
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pop(OrderDimensionsDialogResult(
                            height: double.parse(heightController.text),
                            length: double.parse(lengthController.text),
                            weight: double.parse(weightController.text),
                            width: double.parse(weightController.text)));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OrderDetailsButton(
                    title: "Anuluj",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
