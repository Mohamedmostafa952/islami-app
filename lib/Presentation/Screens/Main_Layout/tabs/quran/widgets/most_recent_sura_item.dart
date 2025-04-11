import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';

class MostRecentSuraItem extends StatelessWidget {
  const MostRecentSuraItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Al-Fatiha",
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "الفاتحه",
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "7 verses",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset(AssetsManager.mostRecentSura)),
          ],
        ),
      ),
    );
  }
}
