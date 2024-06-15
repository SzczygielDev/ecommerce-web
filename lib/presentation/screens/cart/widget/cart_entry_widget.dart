import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class CartEntryWidget extends StatelessWidget {
  const CartEntryWidget({super.key});

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
              const Padding(
                padding: EdgeInsets.only(left: 22, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Produkt A",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Atrybut 1 / Atrybut 2",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "50.0 ZŁ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 110,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: "1",
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
