import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatefulWidget {
  static const route = "/notFound";
  const NotFoundScreen({super.key});

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return const GenericPage(
        child: FractionallySizedBox(
      widthFactor: 0.4,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ":( Nie znaleziono",
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Zasób, którego szukasz, nie istnieje lub został przeniesiony pod inny adres.",
              style: AppTypography.xlarge1,
            )
          ],
        ),
      ),
    ));
  }
}
