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
}
