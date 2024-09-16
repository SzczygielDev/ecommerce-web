import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderPaymentStatusIndicator extends StatelessWidget {
  final PaymentStatus status;
  const OrderPaymentStatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (status) {
          case PaymentStatus.paid:
            return const Icon(
              Icons.check,
              color: AppColors.green,
            );
          case PaymentStatus.unpaid:
            return const Icon(
              Icons.error_outline,
              color: AppColors.red,
            );
          case PaymentStatus.invalid_amount:
            return const Icon(
              Icons.error_outline,
              color: AppColors.red,
            );
        }
      },
    );
  }
}
