import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider_key.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';

import 'payment_transaction.dart';

class AdminPayment {
  final PaymentId id;
  final double amount;
  final double amountPaid;
  final PaymentServiceProviderKey paymentServiceProvider;
  final PaymentStatus status;
  final String paymentURL;
  final List<PaymentTransaction> transactions;

  AdminPayment({
    required this.id,
    required this.amount,
    required this.amountPaid,
    required this.paymentServiceProvider,
    required this.status,
    required this.paymentURL,
    required this.transactions,
  });

  factory AdminPayment.fromJson(Map<String, dynamic> json) => AdminPayment(
      id: PaymentId(json["id"]),
      amount: json["amount"],
      amountPaid: json["amountPaid"],
      paymentServiceProvider:
          PaymentServiceProviderKey(key: json["paymentServiceProvider"]),
      status: PaymentStatus.fromString(json["status"])!,
      paymentURL: json['paymentURL'],
      transactions: (json['transactions'] as List)
          .map((e) => PaymentTransaction.fromJson(e))
          .toList());

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amountPaid": amountPaid,
        "paymentServiceProvider": paymentServiceProvider.key,
        "status": status,
        "paymentURL": paymentURL,
        "transactions": List.of(transactions.map((e) => e.toJson()))
      };
}
