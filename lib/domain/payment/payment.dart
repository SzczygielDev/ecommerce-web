import 'package:ecommerce_web/domain/payment/payment_id.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider_key.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';

class Payment {
  final PaymentId id;
  final double amount;
  final double amountPaid;
  final PaymentServiceProviderKey paymentServiceProvider;
  final PaymentStatus status;
  final String paymentURL;

  Payment(
      {required this.id,
      required this.amount,
      required this.amountPaid,
      required this.paymentServiceProvider,
      required this.status,
      required this.paymentURL});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
      id: PaymentId(json["id"]),
      amount: json["amount"],
      amountPaid: json["amountPaid"],
      paymentServiceProvider:
          PaymentServiceProviderKey(key: json["paymentServiceProvider"]),
      status: PaymentStatus.fromString(json["status"])!,
      paymentURL: json['paymentURL']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amountPaid": amountPaid,
        "paymentServiceProvider": paymentServiceProvider.key,
        "status": status,
        "paymentURL": paymentURL
      };
}
