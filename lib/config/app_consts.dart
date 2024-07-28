class AppConsts {
  static String apiUrl = "http://localhost:8080";
  static String cartId = "8ad53a36-58e5-49e1-9424-c2610b7191d6"; // dev only

  static int paymentWaitingRetries = 5;
  static Duration paymentWaitingDuration = const Duration(seconds: 5);
}
