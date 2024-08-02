import 'package:flutter/material.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_sidemenu.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_sidemenu_expand_button.dart';
import 'package:ecommerce_web/presentation/widget/admin/admin_appbar.dart';
import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';

class DefaultAdminScreen extends StatefulWidget {
  final List<Widget> children;
  const DefaultAdminScreen({super.key, required this.children});

  @override
  State<DefaultAdminScreen> createState() => _DefaultAdminScreenState();
}

class _DefaultAdminScreenState extends State<DefaultAdminScreen> {
  var showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return ScrollableGenericPage.withSideMenu(
        sideMenuFlex: 3,
        contentFlex: 17,
        showSideMenu: showSideMenu,
        sideMenu: showSideMenu
            ? AdminSidemenu(
                collapsed: showSideMenu,
                onCollapsePressed: () {
                  setState(() {
                    showSideMenu = !showSideMenu;
                  });
                },
              )
            : AdminSidemenuExpandButton(
                onPressed: () {
                  setState(() {
                    showSideMenu = !showSideMenu;
                  });
                },
              ),
        padding: EdgeInsets.zero,
        appBar: AdminAppBar(context: context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        ));
  }
}
