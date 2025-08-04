import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/presentation/screens/order/bloc/order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/order/widget/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLoadedView extends StatefulWidget {
  const OrderLoadedView({super.key});

  @override
  State<OrderLoadedView> createState() => _OrderLoadedViewState();
}

class _OrderLoadedViewState extends State<OrderLoadedView> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<OrderBloc, OrderState, List<Order>>(
      selector: (state) {
        return state.orders;
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...state.map(
              (order) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: OrderItemWidget(
                  order: order,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
