import 'package:ecommerce_web/presentation/screens/cart/widget/cart_client_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_delivery_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_entry_widget.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_special_offer_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/cart_summary_section.dart';
import 'package:ecommerce_web/presentation/screens/cart/widget/submit_cart_button.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        return const CartEntryWidget();
                      },
                    )
                  ],
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
  }
}
