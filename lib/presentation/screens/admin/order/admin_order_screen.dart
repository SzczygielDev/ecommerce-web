import 'package:ecommerce_web/domain/command/commands.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/dialog/order_details_dialog.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:ecommerce_web/presentation/widget/command/command_overlay.dart';
import 'package:ecommerce_web/presentation/widget/command/processing_commnad_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class AdminOrderScreen extends StatefulWidget {
  const AdminOrderScreen({super.key});

  @override
  State<AdminOrderScreen> createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;
  OrderStatus get orderStatusFilter => statusTabs[tabIndex - 1];

  List<OrderStatus> statusTabs = [
    OrderStatus.created,
    OrderStatus.accepted,
    OrderStatus.inProgress,
    OrderStatus.ready,
    OrderStatus.sent,
    OrderStatus.rejected,
    OrderStatus.canceled,
  ];

  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
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
          overlay: CommandOverlay(
            children: [
              ...state.processingCommands.map(
                (command) {
                  String message = "";
                  switch (command) {
                    case AcceptOrderCommand():
                      message =
                          "Akceptowanie zamówienia ${command.orderId.value}";
                      break;
                    case BeginPackingOrderCommand():
                      message =
                          "Przyjmowanie do pakowania ${command.orderId.value}";
                      break;
                    case CancelOrderCommand():
                      message =
                          "Anulowanie zamówienia ${command.orderId.value}";
                      break;
                    case CompletePackingOrderCommand():
                      message =
                          "Kończenie pakowania zamówienia ${command.orderId.value}";
                      break;
                    case RejectOrderCommand():
                      message =
                          "Odrzucanie zamówienia ${command.orderId.value}";
                      break;
                    case ReturnOrderCommand():
                      message = "Zwrot zamówienia ${command.orderId.value}";
                      break;
                  }

                  CommandResult? result = state.commandResults.firstWhereOrNull(
                    (element) => element.id.value == command.id.value,
                  );
                  return ProcessingCommandItem(
                    message: message,
                    result: result,
                  );
                },
              )
            ],
          ),
          children: [
            const Text(
              "Zamówienia",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TabBar(
                  onTap: (value) => setState(() {
                    tabIndex = value;
                  }),
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: [
                    const Tab(
                        child: Text(
                      "Wszystkie",
                      style: TextStyle(fontSize: 18),
                    )),
                    ...statusTabs.map(
                      (status) => Tab(
                          child: Text(
                        status.displayName(),
                        style: const TextStyle(fontSize: 18),
                      )),
                    ),
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
                OrderTableHeader(withStatus: tabIndex == 0),
                ...state.orders.where(
                  (orderWrapper) {
                    if (tabIndex == 0) {
                      return true;
                    } else if (orderWrapper.order.status == orderStatusFilter) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ).map(
                  (order) {
                    return OrderTableItem(
                        withStatus: tabIndex == 0,
                        orderWrapper: order,
                        dark: state.orders.indexOf(order).isOdd,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return BlocProvider.value(
                                value: context.read<AdminOrderBloc>(),
                                child: OrderDetailsDialog(
                                  orderWrapper: order,
                                ),
                              );
                            },
                          );
                        });
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }
}
