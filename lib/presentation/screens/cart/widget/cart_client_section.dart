import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartClientSection extends StatelessWidget {
  const CartClientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Twoje dane",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "zmień",
                    style: TextStyle(
                        fontSize: 22, decoration: TextDecoration.underline),
                  )
                ],
              ),
              Divider(),
              Text(
                "Jan Nowak\nWiejska 4\n00-902 Warszawa\n+48 123 123 123\n",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ));
  }
}
