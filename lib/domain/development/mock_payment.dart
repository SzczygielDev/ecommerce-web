class MockPayment {
  final String id;
  final double amount;
  final double amountPaid;
  final String url;
  final String status;
  final String returnUrl;

  MockPayment({
    required this.id,
    required this.amount,
    required this.amountPaid,
    required this.url,
    required this.status,
    required this.returnUrl,
  });

  factory MockPayment.fromJson(Map<String, dynamic> json) => MockPayment(
        id: json["id"],
        amount: json["amount"],
        amountPaid: json["amountPaid"],
        url: json["url"],
        status: json["status"],
        returnUrl: json["returnURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amountPaid": amountPaid,
        "url": url,
        "status": status,
        "returnURL": returnUrl,
      };
}
