enum OrderStatus {
  created,
  accepted,
  rejected,
  inProgress,
  ready,
  sent,
  canceled;

  static OrderStatus? fromString(String value) {
    switch (value) {
      case "CREATED":
        return OrderStatus.created;
      case "ACCEPTED":
        return OrderStatus.accepted;
      case "REJECTED":
        return OrderStatus.rejected;
      case "IN_PROGRESS":
        return OrderStatus.inProgress;
      case "READY":
        return OrderStatus.ready;
      case "SENT":
        return OrderStatus.sent;
      case "CANCELLED":
        return OrderStatus.canceled;
    }
    return null;
  }

  String displayName() {
    switch (this) {
      case OrderStatus.created:
        return "Oczekujące";
      case OrderStatus.accepted:
        return "Przyjęte do realizacji";
      case OrderStatus.rejected:
        return "Odrzucone";
      case OrderStatus.inProgress:
        return "W przygotowaniu";
      case OrderStatus.ready:
        return "Gotowe do wysyłki";
      case OrderStatus.sent:
        return "Wysłane";
      case OrderStatus.canceled:
        return "Anulowane";
    }
  }
}
