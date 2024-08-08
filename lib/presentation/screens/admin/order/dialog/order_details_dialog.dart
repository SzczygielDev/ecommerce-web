import 'package:ecommerce_web/domain/order/order_item.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/model/order_wrapper.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_details_item.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_details_more_items_button.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_details_payment_transaction_widget.dart';
import 'package:ecommerce_web/presentation/screens/admin/order/widget/dialog/order_payment_status_indicator.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/admin_side_dialog.dart';
import 'package:ecommerce_web/presentation/util/date/default_date_time_format.dart';
import 'package:flutter/material.dart';

class OrderDetailsDialog extends StatefulWidget {
  final OrderWrapper orderWrapper;
  const OrderDetailsDialog({super.key, required this.orderWrapper});

  @override
  State<OrderDetailsDialog> createState() => _OrderDetailsDialogState();
}

class _OrderDetailsDialogState extends State<OrderDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    final orderWrapper = widget.orderWrapper;
    final order = orderWrapper.order;
    List<OrderItem> orderItems = [];
    final twoOrMoreProducts = order.items.length > 2;
    if (twoOrMoreProducts) {
      orderItems = order.items.sublist(0, 2);
    } else {
      orderItems = order.items;
    }

    return AdminSideDialog(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Zamówienie NR. ${order.id.value.substring(0, 8)}",
            style: const TextStyle(fontSize: 36),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.status.displayName(),
                style: const TextStyle(fontSize: 32),
              ),
              Text(
                DefaultDateTimeFormat().format(order.createdAt),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Zamawiajacy",
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "szczegóły",
                  style: TextStyle(fontSize: 18, color: AppColors.main),
                ),
              )
            ],
          ),
          const Text(
            "Jan Nowak (jan.nowak@example.com)",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Dostawa",
            style: TextStyle(fontSize: 26),
          ),
          Text(
            orderWrapper.deliveryProvider.displayName,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Produkty",
            style: TextStyle(fontSize: 26),
          ),
          Expanded(
            child: Column(
              children: [
                ...orderItems.map((orderItem) => OrderDetailsItem(
                      item: orderItem,
                    )),
                orderItems.length == 1
                    ? const Spacer()
                    : const SizedBox.shrink(),
                twoOrMoreProducts
                    ? const OrderDetailsMoreItemsButton()
                    : const SizedBox.shrink()
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Koszyk ${order.payment.amount.toStringAsFixed(2)} ZŁ",
              style: const TextStyle(fontSize: 26),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Dostawa 0.0 ZŁ",
              style: TextStyle(fontSize: 26),
            ),
          ),
          /*const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Kod promocyjny -70.0 ZŁ",
              style: TextStyle(fontSize: 26),
            ),
          ),*/
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Suma", style: TextStyle(fontSize: 26)),
              Text("${order.payment.amount} ZŁ",
                  style: const TextStyle(fontSize: 26))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Płatność",
            style: TextStyle(fontSize: 26),
          ),
          Row(
            children: [
              Text(
                orderWrapper.paymentServiceProvider.displayName,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                order.payment.status.displayName(),
                style: const TextStyle(fontSize: 24),
              ),
              OrderPaymentStatusIndicator(
                status: order.payment.status,
              )
            ],
          ),
          ...order.payment.transactions
              .map((e) => OrderDetailsPaymentTransactionWidget(
                    item: e,
                  )),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Zaakceptuj",
                    style: TextStyle(color: AppColors.main, fontSize: 20)),
              )),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Odrzuć",
                    style: TextStyle(color: AppColors.main, fontSize: 20)),
              ))
        ],
      ),
    );
  }
}
