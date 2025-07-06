import 'dart:async';

import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';
import 'dart:developer';

class AuthenticationService extends AuthenticationServiceAbstraction {
  final OidcUserManager manager;

  AuthenticationService(this.manager);

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

      _onAuthStateChanged.add(_mapOidcUser(user));
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

  @override
  Future<UserInfo?> getCurrentUser() async {
    final user = manager.currentUser;

    if (user == null) {
      return null;
    }

    return _mapOidcUser(user);
  }

  UserInfo? _mapOidcUser(OidcUser user) {
    return UserInfo(user.uid ?? "", user.userInfo['email']);
  }

  @override
  Future<void> refreshUserData() async {
    final user = manager.currentUser;
    if (user == null) {
      return;
    }
    _onAuthStateChanged.add(_mapOidcUser(user));
  }
}
