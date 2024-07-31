import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/widget/order_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/dashboard/widget/order_table_item.dart';
import 'package:ecommerce_web/presentation/widget/admin/admin_appbar.dart';
import 'package:ecommerce_web/presentation/widget/scrollable_generic_page.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
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
    return ScrollableGenericPage(
        appBar: AdminAppBar(context: context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        borderSide:
                            BorderSide(color: AppColors.main, width: 1.0),
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
                  ...List.generate(
                    30,
                    (index) => OrderTableItem(dark: index.isOdd),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
