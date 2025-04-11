import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/routes_manager/app_routes.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  // void _onIntroEnd(context) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (_) => const HomePage()),
  //   );
  // }

  Widget _buildImage(String imagePath) {
    return Image.asset(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: ColorsManager.gold);

    const pageDecoration = PageDecoration(
      imageAlignment: Alignment.center,
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        color: ColorsManager.gold,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      imageFlex: 3,
      imagePadding: EdgeInsets.only(top: 150, left: 16, right: 16),
      // titlePadding: EdgeInsets.only(top: 40),
    );

    return IntroductionScreen(
      globalBackgroundColor: ColorsManager.black,
      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      globalHeader: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16),
        child: Image.asset(AssetsManager.islamiLogo),
      ),
      pages: [
        PageViewModel(
          title: "",
          body: "Welcome To Islami App",
          image: _buildImage(AssetsManager.onboarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AssetsManager.onboarding2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AssetsManager.onboarding3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AssetsManager.onboarding4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AssetsManager.onboarding5),
          decoration: pageDecoration,
        ),
      ],
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text(
        'Back',
        style: TextStyle(
          color: ColorsManager.gold,
          fontWeight: FontWeight.w600,
        ),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
          color: ColorsManager.gold,
          fontWeight: FontWeight.w600,
        ),
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          color: ColorsManager.gold,
          fontWeight: FontWeight.w600,
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.splash);
      },
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: ColorsManager.gold,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
