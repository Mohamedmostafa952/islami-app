import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/hadith/widgets/hadithCard.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.hadithBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 1, child: Image.asset(AssetsManager.islamiLogo)),
          Expanded(
            flex: 4,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 600,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
              ),
              items:
                  List.generate(
                    50,
                    (index) => index + 1,
                  ).map((index) => HadithCard(index: index)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
