import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/bloc/admin_catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_description_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_image_selector.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_image_selector_preview.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_name_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_price_input.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_side_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogNewProductDialog extends StatefulWidget {
  const CatalogNewProductDialog({super.key});

  @override
  State<CatalogNewProductDialog> createState() =>
      _CatalogNewProductDialogState();
}

class _CatalogNewProductDialogState extends State<CatalogNewProductDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Uint8List? fileBytes;
  @override
  Widget build(BuildContext context) {
    return AdminSideDialog(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nowy produkt",
              style: TextStyle(fontSize: 36),
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
            OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () {
                  final isValid = formKey.currentState?.validate() ?? false;

                  if (isValid) {
                    context.read<AdminCatalogBloc>().add(
                        AdminCatalogCreateProductEvent(
                            title: nameController.text,
                            description: descriptionController.text,
                            price: double.parse(priceController.text)));
                    Navigator.of(context).pop();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Utwórz",
                      style: TextStyle(color: AppColors.main, fontSize: 20)),
                ))
          ],
        ),
      ),
    );
  }
}
