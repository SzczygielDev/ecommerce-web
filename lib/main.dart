import 'package:ecommerce_web/presentation/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_web/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(textTheme)),
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      home: const CatalogScreen(),
    );
  }
}
