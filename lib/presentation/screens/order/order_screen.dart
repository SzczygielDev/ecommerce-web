import 'package:ecommerce_web/presentation/screens/order/bloc/order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/order/widget/order_item_widget.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
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
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return GenericPage(
          padding: const EdgeInsets.only(
            left: 150,
            right: 150,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Twoje zamówienia",
                style: TextStyle(fontSize: 32),
              ),
              const Divider(),
              SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) {
                  switch (state.loadingState) {
                    case OrderLoadingState.loading:
                      return CircularProgressIndicator();
                    case OrderLoadingState.loaded:
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...state.orders.map(
                            (order) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: OrderItemWidget(
                                order: order,
                              ),
                            ),
                          )
                        ],
                      );
                    case OrderLoadingState.error:
                      return Text("Problem");
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
