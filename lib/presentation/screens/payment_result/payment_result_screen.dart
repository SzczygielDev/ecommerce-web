import 'package:ecommerce_web/presentation/screens/payment_result/bloc/payment_result_bloc.dart';
import 'package:ecommerce_web/presentation/screens/payment_result/view/payment_error_view.dart';
import 'package:ecommerce_web/presentation/screens/payment_result/view/payment_success_view.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentResultScreen extends StatefulWidget {
  static const routeName = "paymentResult";
  static const orderIdPathParam = "orderId";
  static const route = "/$routeName/:$orderIdPathParam";
  const PaymentResultScreen({super.key});

  @override
  State<PaymentResultScreen> createState() => _PaymentResultScreenState();
}

class _PaymentResultScreenState extends State<PaymentResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentResultBloc, PaymentResultState>(
      builder: (context, state) {
        return GenericPage(
          child: Center(
            child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Builder(
                  builder: (context) {
                    switch (state.resultState) {
                      case PaymentResultLoadingState.loading:
                        return const Center(child: CircularProgressIndicator());
                      case PaymentResultLoadingState.success:
                        return const PaymentSuccessView();
                      case PaymentResultLoadingState.error:
                        return PaymentErrorView(
                          paymentUrl: state.paymentUrl!,
                        );
                    }
                  },
                )),
          ),
        );
      },
    );
  }
}
