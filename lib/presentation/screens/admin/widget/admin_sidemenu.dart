import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/admin_catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/admin_dashboard_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/admin_order_screen.dart';
import 'package:ecommerce_web/presentation/screens/admin/users/admin_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminSidemenu extends StatefulWidget {
  final Function() onCollapsePressed;
  final bool collapsed;
  const AdminSidemenu(
      {super.key, required this.onCollapsePressed, required this.collapsed});

  @override
  State<AdminSidemenu> createState() => _AdminSidemenuState();
}

class _AdminSidemenuState extends State<AdminSidemenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.collapsed ? MediaQuery.of(context).size.width * 0.15 : 0,
      color: AppColors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                iconSize: 32,
                onPressed: widget.onCollapsePressed,
                icon: const Icon(
                  Icons.menu,
                ),
                color: AppColors.darkGrey,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Menu",
                style: AppTypography.medium3,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              context.go(AdminDashboardScreen.route);
            },
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text(
              "Panel główny",
              style: AppTypography.medium3,
            ),
          ),
          ListTile(
            onTap: () {
              context.go(AdminOrderScreen.route);
            },
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text(
              "Zamówienia",
              style: AppTypography.medium3,
            ),
          ),
          ListTile(
            onTap: () {
              context.go(AdminCatalogScreen.route);
            },
            leading: const Icon(Icons.category_outlined),
            title: const Text(
              "Katalog produktów",
              style: AppTypography.medium3,
            ),
          ),
          ListTile(
            onTap: () {
              context.go(AdminUserScreen.route);
            },
            leading: const Icon(Icons.person),
            title: const Text(
              "Użytkownicy",
              style: AppTypography.medium3,
            ),
          ),
        ],
      ),
    );
  }
}
