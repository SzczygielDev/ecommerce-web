import 'package:flutter/material.dart';

class OrderErrorView extends StatefulWidget {
  const OrderErrorView({super.key});

  @override
  State<OrderErrorView> createState() => _OrderErrorViewState();
}

class _OrderErrorViewState extends State<OrderErrorView> {
  @override
  Widget build(BuildContext context) {
    return const Text("Wystąpił problem z ładowaniem zamówień");
  }
}
