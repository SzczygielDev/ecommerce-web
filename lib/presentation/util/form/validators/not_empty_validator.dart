class NotEmptyValidator {
  static String? validate(String? value) {
    return (value?.isEmpty ?? true) ? "Pole nie może być puste" : null;
  }
}
