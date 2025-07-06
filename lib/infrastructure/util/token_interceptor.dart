import 'package:dio/dio.dart';
import 'package:oidc/oidc.dart';

class TokenInterceptor extends Interceptor {
  final OidcUserManager manager;
  TokenInterceptor(this.manager);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = manager.currentUser?.token.accessToken;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
