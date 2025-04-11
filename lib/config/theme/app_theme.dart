import 'package:flutter/material.dart';

import '../../Core/colors_manager.dart';

class AppTheme {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.black,
      iconTheme: IconThemeData(color: ColorsManager.gold),
      titleTextStyle: TextStyle(
        color: ColorsManager.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,
    ),
  );
}
