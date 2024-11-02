class AppConsts {
  static String apiUrl = "http://localhost:8080";
  static String s3Url = "http://localhost:8334";

  static int paymentWaitingRetries = 5;
  static Duration paymentWaitingDuration = const Duration(seconds: 5);
}
