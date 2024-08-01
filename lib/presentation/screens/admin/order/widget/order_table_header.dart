import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widget/checkbox_cell.dart';
import '../../widget/default_table_cell.dart';

class OrderTableHeader extends TableRow {
  OrderTableHeader()
      : super(
            decoration: const BoxDecoration(
                color: AppColors.grey,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ))),
            children: [
              const CheckboxCell(),
              const DefaultTableCell(
                title: "Numer",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Kwota",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Status płatności",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Zamawiający",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Data i godzina",
                bold: true,
              ),
              const SizedBox.shrink()
            ]);
}
