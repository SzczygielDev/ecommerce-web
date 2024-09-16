import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTableTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int value) onTap;
  const OrderTableTabBar(
      {super.key, required this.onTap, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (value) {
        onTap(value);

        context.read<AdminOrderBloc>().add(UnselectAllOrdersEvent());
      },
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      controller: tabController,
      tabs: [
        const Tab(
            child: Text(
          "Wszystkie",
          style: AppTypography.small2,
        )),
        Tab(
            child: Text(
          OrderStatus.created.displayName(),
          style: AppTypography.small2,
        )),
        Tab(
            child: Text(
          OrderStatus.accepted.displayName(),
          style: AppTypography.small2,
        )),
        Tab(
            child: Text(
          OrderStatus.inProgress.displayName(),
          style: AppTypography.small2,
        )),
        const Tab(
            child: Text(
          "Wysyłka",
          style: AppTypography.small2,
        )),
        const Tab(
            child: Text(
          "Odrzucone",
          style: AppTypography.small2,
        ))
      ],
    );
  }
}
