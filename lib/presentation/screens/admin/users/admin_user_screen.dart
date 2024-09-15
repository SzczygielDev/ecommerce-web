import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
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
    return const ScrollableGenericPage(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Users"),
          )
        ],
      ),
    ));
  }
}
