import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const GenericPage(
      child: Column(
        children: [
          Text("cart"),
        ],
      ),
    );
  }
}
