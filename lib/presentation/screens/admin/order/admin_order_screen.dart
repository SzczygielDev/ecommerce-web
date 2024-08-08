import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/dialog/order_details_dialog.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminOrderScreen extends StatefulWidget {
  const AdminOrderScreen({super.key});

  @override
  State<AdminOrderScreen> createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminOrderBloc, AdminOrderState>(
      builder: (context, state) {
        return DefaultAdminScreen(
          children: [
            const Text(
              "Zamówienia",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            FractionallySizedBox(
              widthFactor: 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                        child: Text(
                      "Oczekujące",
                      style: TextStyle(fontSize: 18),
                    )),
                    Tab(
                        child: Text("Zaakceptowane",
                            style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: FractionallySizedBox(
                widthFactor: 0.4,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.2,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Wyszukaj",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.main, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.darkGrey, width: 1.0),
                    )),
              ),
            ),
            const SizedBox(height: 40),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
              },
              children: [
                OrderTableHeader(),
                ...state.orders.map(
                  (order) => OrderTableItem(
                      orderWrapper: order,
                      dark: state.orders.indexOf(order).isOdd,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return OrderDetailsDialog(
                              orderWrapper: order,
                            );
                          },
                        );
                      }),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
