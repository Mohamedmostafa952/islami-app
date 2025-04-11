import 'package:flutter/material.dart';
import 'package:islami_app/Core/routes_manager/app_routes.dart';
import 'package:islami_app/config/theme/app_theme.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
