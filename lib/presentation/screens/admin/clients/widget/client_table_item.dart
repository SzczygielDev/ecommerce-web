import 'package:ecommerce_web/domain/client/account_type.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_table_cell.dart';
import 'package:flutter/material.dart';

class ClientTableItem extends TableRow {
  ClientTableItem(Client client)
      : super(children: [
          DefaultTableCell(
            title: client.name,
          ),
          DefaultTableCell(
            title: client.lastName,
          ),
          DefaultTableCell(
            title: client.email,
          ),
          DefaultTableCell(
            title: client.phone,
          ),
          DefaultTableCell(
            title: switch (client.accountType) {
              AccountType.standard => "Zwykłe",
              AccountType.premium => "Premium",
            },
          ),
          DefaultTableCell(
            title:
                "${client.zipCode} ${client.city}, ${client.street} ${client.houseNumber}",
          ),
        ]);
}
