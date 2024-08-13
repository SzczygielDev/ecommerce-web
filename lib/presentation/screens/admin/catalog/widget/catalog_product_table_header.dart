import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/checkbox_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_table_cell.dart';
import 'package:flutter/material.dart';

class CatalogProductTableHeader extends TableRow {
  CatalogProductTableHeader()
      : super(
            decoration: const BoxDecoration(
                color: AppColors.grey,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ))),
            children: [
              CheckboxCell(
                value:
                    false, // TODO - implement table operations for admin product screen
                callback: (value) {},
              ),
              const SizedBox(
                width: 160,
              ),
              const DefaultTableCell(
                title: "Nazwa",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Cena",
                bold: true,
              ),
              const SizedBox.shrink(),
              const SizedBox.shrink(),
            ]);
}
