import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/bloc/mock_payment_bloc.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/widget/mock_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:html' as html;

class MockPaymentScreen extends StatefulWidget {
  static const routeName = "mockPayment";
  static const paymentIdPathParam = "paymentId";
  static const route = "/$routeName/:$paymentIdPathParam";

  const MockPaymentScreen({super.key});

  @override
  State<MockPaymentScreen> createState() => _MockPaymentScreenState();
}

class _MockPaymentScreenState extends State<MockPaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller =
      TextEditingController.fromValue(const TextEditingValue(text: "100.0"));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MockPaymentBloc, MockPaymentState>(
      listener: (context, state) {
        final result = state.result;
        if (result != null) {
          html.window.open(state.payment!.returnUrl.toString(), '_self');
        }
      },
      builder: (context, state) {
        final payment = state.payment;
        if (payment == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Scaffold(
            body: Center(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Transakcja ${payment.id}",
                      style: AppTypography.xlarge1,
                    ),
                    Text(
                      "Do zapłaty: ${payment.amount.toStringAsFixed(2)}",
                      style: AppTypography.medium3,
                    ),
                    Text(
                      "Zapłacono: ${payment.amountPaid.toStringAsFixed(2)}",
                      style: AppTypography.medium3,
                    ),
                    TextFormField(
                      style: AppTypography.medium3,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (double.tryParse(value ?? "") == null) {
                          return "Niepoprawna wartość";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      controller: controller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MockPaymentButton(
                      formKey: formKey,
                      controller: controller,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
