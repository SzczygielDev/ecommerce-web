import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAdminScreen(
      children: [
        const Text(
          "Panel",
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 700,
              color: AppColors.darkGrey,
            )),
            const SizedBox(
              width: 80,
            ),
            Expanded(
              child: Container(
                height: 700,
                color: AppColors.darkGrey,
              ),
            )
          ],
        )
      ],
    );
  }
}
