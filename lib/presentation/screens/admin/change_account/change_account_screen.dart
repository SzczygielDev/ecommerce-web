import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';

class ChangeAccountScreen extends StatefulWidget {
  static const route = "/changeAccount";
  const ChangeAccountScreen({super.key});

  @override
  State<ChangeAccountScreen> createState() => _ChangeAccountScreenState();
}

class _ChangeAccountScreenState extends State<ChangeAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const GenericPage(
        child: Center(
      child: Text(
          "Przeloguj się na konto klienta, aby skorzystać z funkcjonalności."),
    ));
  }
}
