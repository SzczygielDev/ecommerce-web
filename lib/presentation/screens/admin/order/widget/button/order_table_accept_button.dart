import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTableAcceptButton extends StatefulWidget {
  final List<OrderWrapper> selectedOrders;
  const OrderTableAcceptButton({super.key, required this.selectedOrders});

  @override
  State<OrderTableAcceptButton> createState() => _OrderTableAcceptButtonState();
}

class _OrderTableAcceptButtonState extends State<OrderTableAcceptButton> {
  @override
  Widget build(BuildContext context) {
    final selectedOrders = widget.selectedOrders;
    return GenericButton(
        size: const Size(250, 40),
        onPressed: () {
          if (selectedOrders.length == 1) {
            context
                .read<AdminOrderBloc>()
                .add(AcceptOrderEvent(orderId: selectedOrders.first.id));
          } else {
            context.read<AdminOrderBloc>().add(AcceptOrdersBatchEvent(
                orderIds: selectedOrders.map((e) => e.id).toList()));
          }
        },
        title: "Zaakceptuj");
  }
}
