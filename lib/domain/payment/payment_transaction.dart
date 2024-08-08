import 'package:ecommerce_web/domain/payment/payment_transaction_id.dart';

class PaymentTransaction {
  final PaymentTransactionId id;
  final double amount;
  final DateTime timestamp;

  PaymentTransaction({
    required this.id,
    required this.amount,
    required this.timestamp,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      PaymentTransaction(
        id: PaymentTransactionId(json["id"]),
        amount: json["amount"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "timestamp": timestamp,
      };
}
