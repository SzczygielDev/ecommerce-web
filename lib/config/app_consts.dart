class AppConsts {
  static String apiUrl = "http://localhost:8080";

  static int paymentWaitingRetries = 5;
  static Duration paymentWaitingDuration = const Duration(seconds: 5);
}
