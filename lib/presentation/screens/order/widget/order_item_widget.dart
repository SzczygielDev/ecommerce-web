import 'package:ecommerce_web/domain/delivery/delivery_status.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/order/bloc/order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/order/widget/order_cancel_button.dart';
import 'package:ecommerce_web/presentation/screens/order/widget/order_payment_button.dart';
import 'package:ecommerce_web/presentation/screens/order/widget/order_refund_button.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;

import 'package:flutter_bloc/flutter_bloc.dart';

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
                        "Zamówienie nr. ${order.id.value.substring(0, 8)}",
                        style: AppTypography.medium3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Builder(
                        builder: (context) {
                          if (order.status == OrderStatus.sent) {
                            return Text(
                                order.delivery.status
                                    .displayName()
                                    .toUpperCase(),
                                style: AppTypography.medium3);
                          } else {
                            return Text(
                                order.status.displayName().toUpperCase(),
                                style: AppTypography.medium3);
                          }
                        },
                      )
                    ],
                  ),
                  Text(order.createdAt.toLocal().toString(),
                      style: AppTypography.medium1),
                  SizedBox(
                    height: 40,
                  ),
                  Builder(
                    builder: (context) {
                      if (order.payment.status != PaymentStatus.paid) {
                        return OrderPaymentButton(
                          onPressed: () {
                            html.window.open(
                                order.payment.paymentURL.toString(), '_self');
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  Builder(
                    builder: (context) {
                      if (order.canBeCanceled()) {
                        return OrderCancelButton(
                          onPressed: () {
                            context
                                .read<OrderBloc>()
                                .add(CancelOrderEvent(orderId: order.id));
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  Builder(
                    builder: (context) {
                      if (order.delivery.status == DeliveryStatus.delivered) {
                        return OrderRefundButton();
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
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
                          style: AppTypography.medium3),
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
