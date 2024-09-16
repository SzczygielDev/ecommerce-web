import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/bloc/mock_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockPaymentButton extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  const MockPaymentButton(
      {super.key, required this.controller, required this.formKey});

  @override
  State<MockPaymentButton> createState() => _MockPaymentButtonState();
}

class _MockPaymentButtonState extends State<MockPaymentButton> {
  var _inProgress = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: _inProgress
            ? null
            : () {
                final valid = widget.formKey.currentState?.validate() ?? false;
                if (valid) {
                  setState(() {
                    _inProgress = true;
                  });
                  context.read<MockPaymentBloc>().add(MockPaymentSubmitEvent(
                      value: double.parse(widget.controller.text)));
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _inProgress
              ? const CircularProgressIndicator()
              : Text(
                  "Zapłać",
                  style: AppTypography.medium1
                      .merge(const TextStyle(color: AppColors.main)),
                ),
        ));
  }
}
