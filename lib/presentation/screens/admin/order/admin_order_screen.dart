import 'package:ecommerce_web/domain/command/commands.dart';
import 'package:ecommerce_web/domain/command/util/batch_command.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/order/order_status.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/bloc/admin_order_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/dialog/order_details_dialog.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:ecommerce_web/presentation/widget/command/command_overlay.dart';
import 'package:ecommerce_web/presentation/widget/command/processing_batch_command_item.dart';
import 'package:ecommerce_web/presentation/widget/command/processing_command_item.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/order_table_item.dart';
import 'package:flutter/widgets.dart';
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

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
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
        final filteredOrdersForTab = state.orders.where(
          (orderWrapper) {
            final status = orderWrapper.order.status;

            switch (tabIndex) {
              case 0:
                return true;
              case 1:
                return status == OrderStatus.created;
              case 2:
                return status == OrderStatus.accepted;
              case 3:
                return status == OrderStatus.inProgress;
              case 4:
                return status == OrderStatus.ready ||
                    status == OrderStatus.sent;
              case 5:
                return status == OrderStatus.canceled ||
                    status == OrderStatus.rejected;
            }
            return false;
          },
        );

        final selectedOrders = filteredOrdersForTab
            .where((orderWrapper) => orderWrapper.selected)
            .toList();

        OrderStatus? orderOnlySelectedWithStatus;

        final selectedOrdersStatuses = selectedOrders
            .groupSetsBy((orderWrapper) => orderWrapper.order.status)
            .keys
            .toList();

        if (selectedOrdersStatuses.length == 1) {
          orderOnlySelectedWithStatus = selectedOrdersStatuses.first;
        }

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
              ),
              ...state.batchCommands.map((batchCommand) {
                return ProcessBatchCommandItem(
                    results: state.commandResults, command: batchCommand);
              })
            ],
          ),
          children: [
            const Text(
              "Zamówienia",
              style: AppTypography.xlarge1,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TabBar(
                      onTap: (value) {
                        setState(() {
                          tabIndex = value;
                        });
                        context
                            .read<AdminOrderBloc>()
                            .add(UnselectAllOrdersEvent());
                      },
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
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
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {
                            context
                                .read<AdminOrderBloc>()
                                .add(RefreshDataEvent());
                          },
                          icon: const Icon(Icons.refresh_outlined)),
                    ],
                  ),
                )
              ],
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
                widthFactor: 0.6,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Wyszukaj",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.main, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkGrey, width: 1.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: Builder(
                          builder: (ctx) {
                            switch (orderOnlySelectedWithStatus) {
                              case null:
                              case OrderStatus.ready:
                              case OrderStatus.sent:
                              case OrderStatus.canceled:
                              case OrderStatus.rejected:
                                return const SizedBox.shrink();
                              case OrderStatus.created:
                                return Row(
                                  children: [
                                    GenericButton(
                                        size: const Size(250, 40),
                                        onPressed: () {
                                          if (selectedOrders.length == 1) {
                                            context.read<AdminOrderBloc>().add(
                                                AcceptOrderEvent(
                                                    orderId: selectedOrders
                                                        .first.id));
                                          } else {
                                            context.read<AdminOrderBloc>().add(
                                                AcceptOrdersBatchEvent(
                                                    orderIds: selectedOrders
                                                        .map((e) => e.id)
                                                        .toList()));
                                          }
                                        },
                                        title: "Zaakceptuj"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GenericButton(
                                        size: const Size(250, 40),
                                        onPressed: () {
                                          if (selectedOrders.length == 1) {
                                            context.read<AdminOrderBloc>().add(
                                                RejectOrderEvent(
                                                    orderId: selectedOrders
                                                        .first.id));
                                          } else {
                                            context.read<AdminOrderBloc>().add(
                                                RejectOrdersBatchEvent(
                                                    orderIds: selectedOrders
                                                        .map((e) => e.id)
                                                        .toList()));
                                          }
                                        },
                                        title: "Odrzuć")
                                  ],
                                );
                              case OrderStatus.accepted:
                                return selectedOrders
                                        .where((orderWrapper) =>
                                            orderWrapper.order.payment.status !=
                                            PaymentStatus.paid)
                                        .isNotEmpty
                                    ? SizedBox.shrink()
                                    : Row(
                                        children: [
                                          GenericButton(
                                              size: const Size(250, 40),
                                              onPressed: () {
                                                if (selectedOrders.length ==
                                                    1) {
                                                  context
                                                      .read<AdminOrderBloc>()
                                                      .add(
                                                          BeginPackingOrderEvent(
                                                              orderId:
                                                                  selectedOrders
                                                                      .first
                                                                      .id));
                                                } else {
                                                  context.read<AdminOrderBloc>().add(
                                                      BeginPackingOrdersBatchEvent(
                                                          orderIds:
                                                              selectedOrders
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()));
                                                }
                                              },
                                              title: "Rozpocznij pakowanie"),
                                          const Expanded(
                                              child: SizedBox.shrink())
                                        ],
                                      );
                              case OrderStatus.inProgress:
                                return const SizedBox.shrink();
                              /* TODO - in the future
                                return Row(
                                  children: [
                                    GenericButton(
                                        size: const Size(250, 40),
                                        onPressed: () {},
                                        title: "Zakończ pakowanie"),
                                    Expanded(child: SizedBox.shrink())
                                  ],
                                );
                              */
                            }
                          },
                        ))
                  ],
                )),
            const SizedBox(height: 40),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
              },
              children: [
                OrderTableHeader(
                    areAllCellsSelected: filteredOrdersForTab.firstWhereOrNull(
                                (orderWrapper) =>
                                    orderWrapper.selected == false) ==
                            null &&
                        filteredOrdersForTab.isNotEmpty,
                    selectAllCallback: (value) {
                      context.read<AdminOrderBloc>().add(
                          ChangeSelectionMutipleOrdersEvent(
                              value: value,
                              ids: filteredOrdersForTab
                                  .map((e) => e.id)
                                  .toList()));
                    },
                    withStatus:
                        tabIndex == 0 || tabIndex == 4 || tabIndex == 5),
                ...filteredOrdersForTab.map(
                  (order) {
                    return OrderTableItem(
                        onSelected: (value) {
                          context.read<AdminOrderBloc>().add(
                              ChangeSelectionSingleOrderEvent(
                                  value: value, id: order.id));
                        },
                        withStatus:
                            tabIndex == 0 || tabIndex == 4 || tabIndex == 5,
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
