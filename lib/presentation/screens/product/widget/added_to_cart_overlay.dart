import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedToCartOverlay extends StatefulWidget {
  const AddedToCartOverlay({super.key});

  @override
  State<AddedToCartOverlay> createState() => _AddedToCartOverlayState();
}

class _AddedToCartOverlayState extends State<AddedToCartOverlay> {
  bool showingAddedToCartOverlay = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.showAddedToCartDialog && !showingAddedToCartOverlay) {
          setState(() {
            showingAddedToCartOverlay = true;
          });
          Future.delayed(const Duration(seconds: 5))
              .catchError((error) {})
              .then(
            (value) {
              setState(() {
                showingAddedToCartOverlay = false;
              });
              context.read<ProductBloc>().add(AddedToCartOverlayShowedEvent());
            },
          );
        }
      },
      builder: (context, state) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: showingAddedToCartOverlay ? 1 : 0,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70, right: 70),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        border: Border.all(color: Colors.black)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Dodano do koszyka",
                            style: AppTypography.medium3,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.done)
                        ],
                      ),
                    )),
              )),
        );
      },
    );
  }
}
