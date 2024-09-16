enum DeliveryStatus {
  waiting,
  in_delivery,
  delivered;

  static DeliveryStatus? fromString(String value) {
    switch (value) {
      case "WAITING":
        return DeliveryStatus.waiting;
      case "IN_DELIVERY":
        return DeliveryStatus.in_delivery;
      case "DELIVERED":
        return DeliveryStatus.delivered;
    }
    return null;
  }

  String displayName() {
    switch (this) {
      case DeliveryStatus.waiting:
        return "Czeka na wysyłkę";
      case DeliveryStatus.in_delivery:
        return "Wysłane";
      case DeliveryStatus.delivered:
        return "Dostarczone";
    }
  }
}
