class AppConsts {
  static String apiUrl = "http://localhost:8080";
  static String s3Url = "http://localhost:8334";

  static int paymentWaitingRetries = 5;
  static Duration paymentWaitingDuration = const Duration(seconds: 5);

  static Uri oidcWellKnownUri =
      Uri.parse('http://localhost:8085/realms/ecommerce/');
  static String oidcClientId = 'my-web-app';
  static Uri oidcRedirectUri =
      Uri.parse('http://localhost:64427/redirect.html');
  static Uri oidcLogoutRedirectUri =
      Uri.parse('http://localhost:64427/redirect.html');

  static Uri accountUri =
      Uri.parse("http://localhost:8085/realms/ecommerce/account");
}
