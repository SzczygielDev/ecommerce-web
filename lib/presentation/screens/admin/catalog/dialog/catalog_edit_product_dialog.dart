import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/bloc/admin_catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_description_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_image_selector.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_image_selector_preview.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_name_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_price_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_side_dialog.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogEditProductDialog extends StatefulWidget {
  final bool edit;
  final Product? product;
  const CatalogEditProductDialog.create({super.key})
      : product = null,
        edit = false;

  const CatalogEditProductDialog.edit({
    super.key,
    required this.product,
  }) : edit = true;

  @override
  State<CatalogEditProductDialog> createState() =>
      _CatalogEditProductDialogState();
}

class _CatalogEditProductDialogState extends State<CatalogEditProductDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  Uint8List? fileBytes;

  @override
  void initState() {
    nameController =
        TextEditingController(text: widget.edit ? widget.product!.title : null);
    priceController = TextEditingController(
        text: widget.edit ? widget.product!.price.toString() : null);
    descriptionController = TextEditingController(
        text: widget.edit ? widget.product!.description : null);
    super.initState();
  }

  void _create() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (isValid) {
      context.read<AdminCatalogBloc>().add(AdminCatalogCreateProductEvent(
          title: nameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text)));
      Navigator.of(context).pop();
    }
  }

  void _save() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (isValid) {
      context.read<AdminCatalogBloc>().add(AdminCatalogUpdateProductEvent(
          updatedProduct: Product(
              id: widget.product!.id,
              title: nameController.text,
              description: descriptionController.text,
              price: double.parse(priceController.text))));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminSideDialog(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.edit ? "Edytuj produkt" : "Nowy produkt",
              style: AppTypography.xlarge2,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            ProductNameInput(
              controller: nameController,
            ),
            ProductPriceInput(
              controller: priceController,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: fileBytes != null
                    ? ProductImageSelectorPreview(
                        fileBytes: fileBytes!,
                        onRemove: () {
                          setState(() {
                            fileBytes = null;
                          });
                        },
                      )
                    : ProductImageSelector(
                        onSelected: (bytes) {
                          setState(() {
                            fileBytes = bytes;
                          });
                        },
                      )),
            const SizedBox(
              height: 20,
            ),
            ProductDescriptionInput(
              controller: descriptionController,
            ),
            const Spacer(),
            GenericButton(
              onPressed: widget.edit ? _save : _create,
              title: widget.edit ? "Zapisz" : "Utwórz",
              size: const Size.fromHeight(80),
            ),
          ],
        ),
      ),
    );
  }
}
