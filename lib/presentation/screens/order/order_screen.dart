import 'package:ecommerce_web/presentation/screens/order/bloc/order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/order/view/order_error_view.dart';
import 'package:ecommerce_web/presentation/screens/order/view/order_loaded_view.dart';
import 'package:ecommerce_web/presentation/screens/order/view/order_loading_view.dart';
import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<OrderBloc, OrderState, OrderLoadingState>(
      selector: (state) {
        return state.loadingState;
      },
      builder: (context, state) {
        return ScrollableGenericPage(
          padding: const EdgeInsets.only(
            left: 150,
            right: 150,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Twoje zamówienia",
                style: TextStyle(fontSize: 32),
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) {
                  switch (state) {
                    case OrderLoadingState.loading:
                      return const OrderLoadingView();
                    case OrderLoadingState.loaded:
                      return const OrderLoadedView();
                    case OrderLoadingState.error:
                      return const OrderErrorView();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
