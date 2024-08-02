import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/button_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/checkbox_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_table_cell.dart';
import 'package:flutter/material.dart';

class CatalogProductTableItem extends TableRow {
  CatalogProductTableItem({bool dark = false})
      : super(
            decoration: BoxDecoration(
              color: dark ? AppColors.grey : null,
            ),
            children: [
              const CheckboxCell(),
              Container(
                height: 160,
                width: 160,
                color: dark ? Colors.blue : Colors.green,
              ),
              const DefaultTableCell(
                title: "Produkt A",
              ),
              const DefaultTableCell(
                title: "300.0 ZŁ",
              ),
              ButtonCell(onPressed: () {}, title: "Edytuj"),
              ButtonCell(onPressed: () {}, title: "Usuń"),
            ]);
}
