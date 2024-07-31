import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/widget/button_cell.dart';
import 'package:flutter/material.dart';

import 'checkbox_cell.dart';
import 'default_table_cell.dart';

class OrderTableItem extends TableRow {
  OrderTableItem({bool dark = false})
      : super(
            decoration: BoxDecoration(
              color: dark ? AppColors.grey : null,
            ),
            children: [
              const CheckboxCell(),
              const DefaultTableCell(
                title: "NR. 0033123",
              ),
              const DefaultTableCell(
                title: "353.0 ZŁ",
              ),
              const DefaultTableCell(
                title: "Opłacone",
              ),
              const DefaultTableCell(
                title: "Jan Nowak (jan.nowak@example.com)",
              ),
              const DefaultTableCell(
                title: "20:40:31 20.07.2024",
              ),
              ButtonCell(
                title: 'Szczegóły',
                onPressed: () {},
              )
            ]);
}
