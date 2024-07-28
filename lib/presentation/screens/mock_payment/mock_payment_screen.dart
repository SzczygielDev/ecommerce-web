import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/mock_payment/bloc/mock_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:html' as html;

class MockPaymentScreen extends StatefulWidget {
  const MockPaymentScreen({super.key});

  @override
  State<MockPaymentScreen> createState() => _MockPaymentScreenState();
}

class _MockPaymentScreenState extends State<MockPaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller =
      TextEditingController.fromValue(const TextEditingValue(text: "100.0"));
  var _inProgress = false;

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
                      style: const TextStyle(fontSize: 32),
                    ),
                    Text(
                      "Do zapłaty: ${payment.amount.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Zapłacono: ${payment.amountPaid.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 24),
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
                    OutlinedButton(
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
                                final valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  setState(() {
                                    _inProgress = true;
                                  });
                                  context.read<MockPaymentBloc>().add(
                                      MockPaymentSubmitEvent(
                                          value:
                                              double.parse(controller.text)));
                                }
                              },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _inProgress
                              ? const CircularProgressIndicator()
                              : const Text("Zapłać",
                                  style: TextStyle(
                                      color: AppColors.main, fontSize: 20)),
                        ))
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
