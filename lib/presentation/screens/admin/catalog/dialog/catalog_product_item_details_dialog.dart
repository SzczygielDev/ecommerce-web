import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/cubit/product_price_history_cubit.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/dialog/product_price_history.dialog.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_side_dialog.dart';
import 'package:ecommerce_web/presentation/screens/product/product_screen.dart';
import 'package:ecommerce_web/presentation/util/image/image_url_resolver.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
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
            style: AppTypography.xlarge2,
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
                style: AppTypography.xlarge1,
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  context.go(
                      ProductScreen.routeForProduct(widget.product.id.value));
                },
                child: Text(
                  "Strona produktu",
                  style: AppTypography.small2
                      .merge(const TextStyle(color: AppColors.main)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "${widget.product.price.toStringAsFixed(2)} ZŁ",
                style: AppTypography.large1,
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
                child: Text(
                  "Historia zmian",
                  style: AppTypography.small2
                      .merge(const TextStyle(color: AppColors.main)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Center(
              child: Image.network(
                  ImageUrlResolver.getUrlForImage(widget.product.imageId)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.product.description,
            style: AppTypography.medium3,
          ),
          const Spacer(),
          GenericButton(
            size: const Size.fromHeight(80),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            title: "Edytuj",
          ),
        ],
      ),
    );
  }
}
