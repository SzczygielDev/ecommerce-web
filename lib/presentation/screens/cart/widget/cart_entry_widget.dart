import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/cart_item.dart';
import 'package:flutter/material.dart';

class CartEntryWidget extends StatelessWidget {
  final CartItem item;
  const CartEntryWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          color: AppColors.grey,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                color: AppColors.shimmerGrey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "${item.price} ZŁ",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 110,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: item.quantity.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
