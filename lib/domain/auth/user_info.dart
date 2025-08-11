import 'package:ecommerce_web/domain/auth/role.dart';

class UserInfo {
  final String id;
  final String email;
  final List<Role> roles;

  UserInfo(this.id, this.email, this.roles);
}
