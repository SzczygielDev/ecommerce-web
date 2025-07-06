import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  usePathUrlStrategy();
  setupLocator();

  final authService = locator.get<AuthenticationServiceAbstraction>();
  await authService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          locator.get<AuthenticationBloc>(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
            textTheme: GoogleFonts.latoTextTheme(textTheme),
            useMaterial3: true),
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
