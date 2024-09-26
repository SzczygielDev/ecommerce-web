import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/button_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/checkbox_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_table_cell.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/ink_well_cell.dart';
import 'package:ecommerce_web/presentation/util/image/image_url_resolver.dart';
import 'package:flutter/material.dart';

class CatalogProductTableItem extends TableRow {
  CatalogProductTableItem(
      {required Product product,
      required Function() onPressed,
      required Function() onEdit,
      required Function() onDelete,
      bool dark = false})
      : super(
            decoration: BoxDecoration(
              color: dark ? AppColors.grey : null,
            ),
            children: [
              CheckboxCell(
                value:
                    false, // TODO - implement table operations for admin product screen
                callback: (value) {},
              ),
              Container(
                height: 160,
                width: 160,
                child: Image.network(
                    ImageUrlResolver.getUrlForImage(product.imageId)),
              ),
              InkWellCell(
                onPressed: onPressed,
                title: product.title,
              ),
              DefaultTableCell(
                title: "${product.price.toStringAsFixed(2)} ZŁ",
              ),
              ButtonCell(onPressed: onEdit, title: "Edytuj"),
              ButtonCell(onPressed: onDelete, title: "Usuń"),
            ]);
}
