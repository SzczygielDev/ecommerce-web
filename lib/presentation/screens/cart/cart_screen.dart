import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_client_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_delivery_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_entry_widget.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_special_offer_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_summary_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/submit_cart_button.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return GenericPage(
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
                    style: TextStyle(fontSize: 32),
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
                        switch (state) {
                          case CartLoadingState():
                          case CartErrorState():
                            break;
                          case CartLoadedState():
                            items = state.items
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
                  Expanded(
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
                        CartSpecialOfferSection(),
                        SizedBox(
                          height: 54,
                        ),
                        CartSummarySection(),
                        SizedBox(
                          height: 26,
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            switch (state) {
                              case CartLoadedState():
                                return SubmitCartButton(
                                  total: state.cartTotal,
                                );
                              case CartLoadingState():
                              case CartErrorState():
                                return const SubmitCartButton.disabled();
                            }
                          },
                        )
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
