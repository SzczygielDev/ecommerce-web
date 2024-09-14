enum CartStatus {
  active,
  submitted;

  static CartStatus? fromString(String value) {
    switch (value) {
      case "ACTIVE":
        return CartStatus.active;
      case "SUBMITTED":
        return CartStatus.submitted;
    }
    return null;
  }
}
