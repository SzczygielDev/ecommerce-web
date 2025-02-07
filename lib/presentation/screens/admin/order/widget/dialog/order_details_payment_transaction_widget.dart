import 'package:ecommerce_web/domain/payment/payment_transaction.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/util/date/default_date_time_format.dart';
import 'package:flutter/material.dart';

class OrderDetailsPaymentTransactionWidget extends StatelessWidget {
  final PaymentTransaction item;
  const OrderDetailsPaymentTransactionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text("Transakcja ${item.id.value.substring(0, 8)} ",
              style: AppTypography.small2),
          const SizedBox(
            width: 20,
          ),
          Text("${item.amount.toStringAsFixed(2)} ZŁ",
              style: AppTypography.small2),
          const Spacer(),
          Text(DefaultDateTimeFormat().format(item.timestamp),
              style: AppTypography.small2),
        ],
      ),
    );
  }
}
