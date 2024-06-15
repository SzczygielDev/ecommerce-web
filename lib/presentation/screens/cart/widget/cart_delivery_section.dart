import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartDeliverySection extends StatefulWidget {
  const CartDeliverySection({super.key});

  @override
  State<CartDeliverySection> createState() => _CartDeliverySectionState();
}

class _CartDeliverySectionState extends State<CartDeliverySection> {
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
                    "Dostawa",
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
                "Punkt odbioru WAW23",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ));
  }
}
