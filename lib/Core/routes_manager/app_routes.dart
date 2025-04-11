import 'package:flutter/cupertino.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/main_layout.dart';
import 'package:islami_app/Presentation/Screens/Splash/splash.dart';
import 'package:islami_app/Presentation/Screens/onboarding/onboarding.dart';
import 'package:islami_app/Presentation/Screens/quran_details/quran_details.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String quranDetails = "/quranDetails";
  static const String onboarding = "/onboarding";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => Splash(),
    mainLayout: (_) => MainLayout(),
    quranDetails: (_) => QuranDetails(),
    onboarding: (_) => Onboarding(),
  };
}
