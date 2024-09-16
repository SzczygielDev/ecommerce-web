enum PaymentStatus {
  paid,
  unpaid,
  invalid_amount;

  static PaymentStatus? fromString(String value) {
    switch (value) {
      case "PAID":
        return PaymentStatus.paid;
      case "UNPAID":
        return PaymentStatus.unpaid;
      case "INVALID_AMOUNT":
        return PaymentStatus.invalid_amount;
    }
    return null;
  }

  String displayName() {
    switch (this) {
      case PaymentStatus.paid:
        return "Opłacone";
      case PaymentStatus.unpaid:
        return "Nieopłacone";
      case PaymentStatus.invalid_amount:
        return "Niepoprawna kwota";
    }
  }
}
