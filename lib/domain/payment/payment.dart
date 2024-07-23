import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';

class Payment {
  final PaymentId id;
  final double amount;
  final double amountPaid;
  final String paymentServiceProvider;
  final PaymentStatus status;

  const Payment(
      {required this.id,
      required this.amount,
      required this.amountPaid,
      required this.paymentServiceProvider,
      required this.status});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: PaymentId(json["id"]),
        amount: json["amount"],
        amountPaid: json["amountPaid"],
        paymentServiceProvider: json["paymentServiceProvider"],
        status: PaymentStatus.fromString(json["status"])!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amountPaid": amountPaid,
        "paymentServiceProvider": paymentServiceProvider,
        "status": status,
      };
}
