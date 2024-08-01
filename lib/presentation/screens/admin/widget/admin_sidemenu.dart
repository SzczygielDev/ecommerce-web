import 'package:ecommerce_web/presentation/config/app_colors.dart';
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
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              context.go("/admin");
            },
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text(
              "Panel główny",
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              context.go("/admin/orders");
            },
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text(
              "Zamówienia",
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              context.go("/admin/catalog");
            },
            leading: const Icon(Icons.category_outlined),
            title: const Text(
              "Katalog produktów",
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              context.go("/admin/users");
            },
            leading: const Icon(Icons.person),
            title: const Text(
              "Użytkownicy",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
