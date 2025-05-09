import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/dialog/cart_submit_error_dialog.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_client_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_delivery_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_entry_widget.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_special_offer_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_summary_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/submit_cart_button.dart';
import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;
import 'widget/cart_payment_section.dart';

class CartScreen extends StatefulWidget {
  static const route = "/cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool cartSubmitErrorDialogLock = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.cartSubmitState == CartSubmitState.redirect) {
          html.window.open(state.redirectUrl.toString(), '_self');
        } else if (state.cartSubmitState == CartSubmitState.error) {
          if (!cartSubmitErrorDialogLock) {
            setState(() {
              cartSubmitErrorDialogLock = true;
            });
            showDialog(
                    context: context,
                    builder: (context) => const CartSubmitErrorDialog())
                .then((value) {
              setState(() {
                cartSubmitErrorDialogLock = false;
              });
              context.read<CartBloc>().add(CartSubmitErrorDialogShowedEvent());
            });
          }
        }
      },
      builder: (context, state) {
        return ScrollableGenericPage(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 50,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Twój koszyk",
                    style: AppTypography.xlarge1,
                  )
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        List<Widget> items = [];

                        switch (state.loadingState) {
                          case CartLoadingState.loading:
                          case CartLoadingState.error:
                            break;

                          case CartLoadingState.loaded:
                            items = state.items!
                                .map(
                                  (e) => CartEntryWidget(
                                    item: e,
                                  ),
                                )
                                .toList();
                            break;
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: items,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  const Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CartClientSection(),
                        SizedBox(
                          height: 26,
                        ),
                        CartDeliverySection(),
                        SizedBox(
                          height: 26,
                        ),
                        CartPaymentSection(),
                        SizedBox(
                          height: 26,
                        ),
                        CartSpecialOfferSection(),
                        SizedBox(
                          height: 54,
                        ),
                        CartSummarySection(),
                        SizedBox(
                          height: 26,
                        ),
                        SubmitCartButton()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
