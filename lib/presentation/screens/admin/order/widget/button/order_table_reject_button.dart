import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTableRejectButton extends StatefulWidget {
  final List<OrderWrapper> selectedOrders;
  const OrderTableRejectButton({super.key, required this.selectedOrders});

  @override
  State<OrderTableRejectButton> createState() => _OrderTableRejectButtonState();
}

class _OrderTableRejectButtonState extends State<OrderTableRejectButton> {
  @override
  Widget build(BuildContext context) {
    final selectedOrders = widget.selectedOrders;
    return GenericButton(
        size: const Size(250, 40),
        onPressed: () {
          if (selectedOrders.length == 1) {
            context
                .read<AdminOrderBloc>()
                .add(RejectOrderEvent(orderId: selectedOrders.first.id));
          } else {
            context.read<AdminOrderBloc>().add(RejectOrdersBatchEvent(
                orderIds: selectedOrders.map((e) => e.id).toList()));
          }
        },
        title: "Odrzuć");
  }
}
