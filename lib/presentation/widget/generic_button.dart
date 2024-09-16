import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatefulWidget {
  final Function()? onPressed;
  final String title;
  final ButtonStyle style;
  final Size? size;

  const GenericButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.style = const ButtonStyle(),
      this.size});

  @override
  State<GenericButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: widget.style.merge(ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: widget.size,
        )),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.title,
              style: AppTypography.medium1
                  .merge(const TextStyle(color: AppColors.main))),
        ));
  }
}
