import 'dart:async';

import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/auth/role.dart';
import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:logger/logger.dart';
import 'package:oidc/oidc.dart';
import 'dart:convert';

class AuthenticationService extends AuthenticationServiceAbstraction {
  final OidcUserManager manager;
  final Logger logger;

  AuthenticationService(this.manager, this.logger);

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
    final parsedAccessToken = _parseToken(user.token.accessToken!);
    final rawRoleList = parsedAccessToken["realm_access"]["roles"];
    List<Role> roles = [];
    if (rawRoleList is List) {
      if (rawRoleList.contains("client")) {
        roles.add(Role.client);
      }
      if (rawRoleList.contains("admin")) {
        roles.add(Role.admin);
      }
    }

    return UserInfo(user.uid ?? "", user.userInfo['email'], roles);
  }

  @override
  Future<void> refreshUserData() async {
    final user = manager.currentUser;
    if (user == null) {
      return;
    }
    _onAuthStateChanged.add(_mapOidcUser(user));
  }

  Map<String, dynamic> _parseToken(String token) {
    try {
      final splittedToken = token.split(".");

      if (splittedToken.length != 3) {
        logger.e("Malformed token, cannot parse");
        return {};
      }

      final rawTokenData = splittedToken[1];
      String normalizedSource = base64Url.normalize(rawTokenData);
      final utf8List = base64Url.decode(normalizedSource);
      final rawJson = utf8.decode(utf8List);
      final json = jsonDecode(rawJson);
      return json;
    } on Exception catch (e) {
      logger.e("Exception while parsing token='$e'");
      return {};
    }
  }
}
