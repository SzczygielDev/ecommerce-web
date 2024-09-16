import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:flutter/material.dart';

class AdminUserScreen extends StatefulWidget {
  static const route = "/admin/users";
  const AdminUserScreen({super.key});

  @override
  State<AdminUserScreen> createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultAdminScreen(
      children: [
        Center(
          child: Text("Users"),
        )
      ],
    );
  }
}
