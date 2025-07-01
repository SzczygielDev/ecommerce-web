import 'dart:async';

import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';

class AuthenticationService extends AuthenticationServiceAbstraction {
  final manager = OidcUserManager.lazy(
    discoveryDocumentUri:
        OidcUtils.getOpenIdConfigWellKnownUri(AppConsts.oidcWellKnownUri),
    clientCredentials: OidcClientAuthentication.none(
      clientId: AppConsts.oidcClientId,
    ),
    store: OidcDefaultStore(),
    settings: OidcUserManagerSettings(
        redirectUri: AppConsts.oidcRedirectUri,
        postLogoutRedirectUri: AppConsts.oidcLogoutRedirectUri),
  );

  final StreamController<UserInfo?> _onAuthStateChanged =
      StreamController<UserInfo?>.broadcast();

  @override
  Future<void> initialize() async {
    await manager.init();

    manager.userChanges().listen((user) {
      if (user == null) {
        _onAuthStateChanged.add(null);
        return;
      }

      _onAuthStateChanged.add(UserInfo(user.userInfo['given_name'],
          user.userInfo['family_name'], user.userInfo['email']));
    });
  }

  @override
  Future<void> logout() async {
    await manager.logout();
  }

  @override
  Future<void> signIn() async {
    await manager.loginAuthorizationCodeFlow();
  }

  @override
  Stream<UserInfo?> get onAuthStateChanged => _onAuthStateChanged.stream;

  @override
  Future<void> dispose() async {
    await _onAuthStateChanged.close();
  }
}
