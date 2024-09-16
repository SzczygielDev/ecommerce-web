class DecimalValidator {
  static String? validate(String? value) {
    return double.tryParse(value ?? "") == null
        ? "Wartość musi być cyfrą"
        : null;
  }
}
