import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/cubit/product_price_history_cubit.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/dialog/product_price_history.dialog.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_side_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatalogProductItemDetailsDialog extends StatefulWidget {
  final Product product;
  const CatalogProductItemDetailsDialog({super.key, required this.product});

  @override
  State<CatalogProductItemDetailsDialog> createState() =>
      _CatalogProductItemDetailsDialogState();
}

class _CatalogProductItemDetailsDialogState
    extends State<CatalogProductItemDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return AdminSideDialog(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Szczegóły produktu",
            style: TextStyle(fontSize: 36),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                widget.product.title,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  context.go('/products/${widget.product.id.value}');
                },
                child: const Text(
                  "Strona produktu",
                  style: TextStyle(fontSize: 18, color: AppColors.main),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "${widget.product.price.toStringAsFixed(2)} ZŁ",
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => BlocProvider.value(
                            value: ProductPriceHistoryCubit(
                                productAdminRepository: locator
                                    .get<ProductAdminRepositoryAbstraction>())
                              ..load(widget.product.id),
                            child: const ProductPriceHistoryDialog(),
                          ));
                },
                child: const Text(
                  "Historia zmian",
                  style: TextStyle(fontSize: 18, color: AppColors.main),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.product.description,
            style: const TextStyle(fontSize: 24),
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
                Navigator.of(context).pop(true);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Edytuj",
                    style: TextStyle(color: AppColors.main, fontSize: 20)),
              ))
        ],
      ),
    );
  }
}
