import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widget/default_table_cell.dart';

class ClientTableHeader extends TableRow {
  ClientTableHeader()
      : super(
            decoration: const BoxDecoration(
                color: AppColors.grey,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ))),
            children: [
              const DefaultTableCell(
                title: "Imie",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Nazwisko",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Email",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Telefon",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Typ konta",
                bold: true,
              ),
              const DefaultTableCell(
                title: "Dane adresowe",
                bold: true,
              ),
            ]);
}
