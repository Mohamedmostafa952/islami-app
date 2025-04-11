import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/constants_manager.dart';
import 'package:islami_app/Core/routes_manager/app_routes.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({super.key, required this.suraDM});

  final SuraDM suraDM;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.quranDetails, arguments: suraDM);
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
            mainAxisAlignment: MainAxisAlignment.center,
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
