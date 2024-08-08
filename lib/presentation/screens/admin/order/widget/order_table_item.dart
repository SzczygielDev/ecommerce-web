import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_payment_status_indicator.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/button_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/widget_table_cell.dart';
import 'package:ecommerce_web/presentation/util/date/default_date_time_format.dart';
import 'package:flutter/material.dart';

import '../../widget/checkbox_cell.dart';
import '../../widget/default_table_cell.dart';

class OrderTableItem extends TableRow {
  OrderTableItem(
      {bool dark = false,
      required OrderWrapper orderWrapper,
      required Function() onPressed})
      : super(
            decoration: BoxDecoration(
              color: dark ? AppColors.grey : null,
            ),
            children: [
              const CheckboxCell(),
              DefaultTableCell(
                title: "NR. ${orderWrapper.order.id.value}",
              ),
              DefaultTableCell(
                title:
                    "${orderWrapper.order.payment.amount.toStringAsFixed(2)} ZŁ",
              ),
              WidgetTableCell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      orderWrapper.order.payment.status.displayName(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OrderPaymentStatusIndicator(
                        status: orderWrapper.order.payment.status)
                  ],
                ),
              ),
              const DefaultTableCell(
                title: "Jan Nowak (jan.nowak@example.com)",
              ),
              DefaultTableCell(
                title: DefaultDateTimeFormat()
                    .format(orderWrapper.order.createdAt),
              ),
              ButtonCell(
                title: 'Szczegóły',
                onPressed: onPressed,
              )
            ]);
}
