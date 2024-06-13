import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_active_filter_chip.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_empty_category_placeholder.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_item_loading_placeholder.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogMainSection extends StatelessWidget {
  const CatalogMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 0),
            child: Row(
              children: [
                CatalogActiveFilterChip(),
                SizedBox(
                  width: 15,
                ),
                CatalogActiveFilterChip(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state.productsLoadingState ==
                  ProductLoadingState.inProgress) {
                return Wrap(
                  children: List.generate(
                    4,
                    (index) => const CatalogItemLoadingPlaceholder(),
                  ).toList(),
                );
              }

              if (state.products.isEmpty) {
                return const Center(child: CatalogEmptyCategoryPlaceholder());
              }

              return Wrap(
                children: state.products
                    .map(
                      (e) => CatalogItemWidget(product: e),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
