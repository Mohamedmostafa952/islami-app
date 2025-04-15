import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';

class TasbihBody extends StatefulWidget {
  const TasbihBody({super.key});

  @override
  State<TasbihBody> createState() => _TasbihBodyState();
}

class _TasbihBodyState extends State<TasbihBody> {
  String elAya = "سَبِّحِ اسْمَ رَبِّكَ الأعلى ";
  String tazkir = "سبحان الله";
  int counter = 1;
  double rotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          elAya,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 36,
          ),
        ),
        InkWell(
          onTap: sebhaRotation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.sebhaHead, height: 70, width: 70),
                  Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      AssetsManager.sebhaBody,
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    tazkir,
                    style: TextStyle(
                      color: ColorsManager.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    "$counter",
                    style: TextStyle(
                      color: ColorsManager.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void sebhaRotation() {
    counter++;
    rotationAngle += 7;
    if (counter == 33 && tazkir == "الله اكبر") {
      tazkir = "سبحان الله";
      elAya = "سَبِّحِ اسْمَ رَبِّكَ الأعلى ";
      counter = 1;
    } else if (counter == 33 &&
        tazkir != "الحمد لله" &&
        tazkir != "لا اله الا الله") {
      tazkir = "الحمد لله";
      elAya = "َفسَبِّحْ بِحَمْدِ رَبِّكَ";
      counter = 1;
    } else if (counter == 33 &&
        tazkir != "لا اله الا الله" &&
        tazkir != "الله اكبر") {
      tazkir = "لا اله الا الله";
      elAya = "قُلْ هُوَ اللَّهُ أَحَدٌ";
      counter = 1;
    } else if (counter == 33) {
      tazkir = "الله اكبر";
      elAya = "وَرَبَّكَ فَكَبِّرْ";
      counter = 1;
    }
    setState(() {});
  }
}
