import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final Order order;
  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Zamówienie NR.${order.id.value}",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(order.status.displayName().toUpperCase(),
                          style: TextStyle(fontSize: 24)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(order.delivery.status.displayName().toUpperCase(),
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  Text(order.createdAt.toLocal().toString(),
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(250, 40),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Anuluj zamówienie",
                            style:
                                TextStyle(color: AppColors.main, fontSize: 20)),
                      ))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                          "SUMA\t${order.payment.amount.toStringAsFixed(2)} ZŁ",
                          style: TextStyle(fontSize: 24)),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      color: AppColors.darkGrey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      color: AppColors.darkGrey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      color: AppColors.darkGrey,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
