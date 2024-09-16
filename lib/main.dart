import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
          textTheme: GoogleFonts.latoTextTheme(textTheme),
          useMaterial3: true),
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
    );
  }
}
