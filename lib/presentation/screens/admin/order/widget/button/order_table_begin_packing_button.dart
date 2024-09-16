import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTableBeginPackingButton extends StatefulWidget {
  final List<OrderWrapper> selectedOrders;
  const OrderTableBeginPackingButton({super.key, required this.selectedOrders});

  @override
  State<OrderTableBeginPackingButton> createState() =>
      _OrderTableBeginPackingButtonState();
}

class _OrderTableBeginPackingButtonState
    extends State<OrderTableBeginPackingButton> {
  @override
  Widget build(BuildContext context) {
    final selectedOrders = widget.selectedOrders;
    return GenericButton(
        size: const Size(250, 40),
        onPressed: () {
          if (selectedOrders.length == 1) {
            context
                .read<AdminOrderBloc>()
                .add(BeginPackingOrderEvent(orderId: selectedOrders.first.id));
          } else {
            context.read<AdminOrderBloc>().add(BeginPackingOrdersBatchEvent(
                orderIds: selectedOrders.map((e) => e.id).toList()));
          }
        },
        title: "Rozpocznij pakowanie");
  }
}
