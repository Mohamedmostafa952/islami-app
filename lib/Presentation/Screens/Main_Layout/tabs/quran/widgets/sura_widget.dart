import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/constants_manager.dart';
import 'package:islami_app/Core/prefs_manager/prefs_manager.dart';
import 'package:islami_app/Core/routes_manager/app_routes.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/quran/widgets/most_recent_sura_item.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({
    super.key,
    required this.suraDM,
    required this.mostRecentKey,
  });

  final SuraDM suraDM;
  final GlobalKey<MostRecentState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.addSuraIndex(suraDM.index - 1);
        Navigator.of(context).pushNamed(
          AppRoutes.quranDetails,
          arguments: QuranDetailsArgument(
            suraDM: suraDM,
            mostRecentKey: mostRecentKey,
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberImage),
              Text(
                "${suraDM.index}",
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraDM.suraNameEn,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                suraDM.verses,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDM.suraNameAr,
            style: TextStyle(
              color: ColorsManager.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class QuranDetailsArgument {
  SuraDM suraDM;
  GlobalKey<MostRecentState> mostRecentKey;

  QuranDetailsArgument({required this.suraDM, required this.mostRecentKey});
}
