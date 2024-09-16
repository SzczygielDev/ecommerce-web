import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTableRefreshButton extends StatelessWidget {
  const OrderTableRefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<AdminOrderBloc>().add(RefreshDataEvent());
        },
        icon: const Icon(Icons.refresh_outlined));
  }
}
