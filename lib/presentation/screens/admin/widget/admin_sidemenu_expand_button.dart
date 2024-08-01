import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class AdminSidemenuExpandButton extends StatefulWidget {
  final Function() onPressed;
  const AdminSidemenuExpandButton({super.key, required this.onPressed});

  @override
  State<AdminSidemenuExpandButton> createState() =>
      _AdminSidemenuExpandButtonState();
}

class _AdminSidemenuExpandButtonState extends State<AdminSidemenuExpandButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      onPressed: widget.onPressed,
      icon: const Icon(Icons.menu),
      color: AppColors.darkGrey,
    );
  }
}
