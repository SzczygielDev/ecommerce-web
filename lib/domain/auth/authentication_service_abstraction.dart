import 'user_info.dart';

abstract class AuthenticationServiceAbstraction {
  Future<void> initialize();
  Future<void> dispose();

  Future<void> signIn();
  Future<void> logout();
  Stream<UserInfo?> get onAuthStateChanged;
  Future<UserInfo?> getCurrentUser();

  Future<void> refreshUserData();
}
