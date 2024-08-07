import 'package:ecommerce_web/presentation/screens/admin/catalog/cubit/product_price_history_cubit.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/dialog/product_price_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceHistoryDialog extends StatefulWidget {
  const ProductPriceHistoryDialog({super.key});

  @override
  State<ProductPriceHistoryDialog> createState() =>
      _ProductPriceHistoryDialogState();
}

class _ProductPriceHistoryDialogState extends State<ProductPriceHistoryDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPriceHistoryCubit, ProductPriceHistoryState>(
      builder: (context, state) {
        switch (state.loadingState) {
          case ProductPriceHistoryLoadingState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProductPriceHistoryLoadingState.loaded:
            final priceChanges = state.product!.priceChanges;
            return FractionallySizedBox(
              widthFactor: 0.3,
              child: Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Historia zmian ceny",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    priceChanges.isEmpty
                        ? const Text("Brak zmian ceny")
                        : Column(
                            children: [
                              ...priceChanges.map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ProductPriceHistoryItem(
                                    priceChange: e,
                                  )))
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          case ProductPriceHistoryLoadingState.error:
            return const Dialog(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Wystąpił błąd",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
        }
      },
    );
  }
}
