import 'package:ecommerce_web/presentation/widget/global_appbar.dart';
import 'package:ecommerce_web/presentation/widget/global_footer.dart';
import 'package:flutter/material.dart';

class GenericPage extends StatefulWidget {
  final Widget child;
  const GenericPage({super.key, required this.child});

  @override
  State<GenericPage> createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        context: context,
      ),
      body: Column(
        children: [Expanded(child: widget.child), const GlobalFooter()],
      ),
    );
  }
}
