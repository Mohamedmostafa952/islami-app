import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/constants_manager.dart';
import 'package:islami_app/Core/prefs_manager/prefs_manager.dart';

class MostRecent extends StatefulWidget {
  const MostRecent({super.key});

  @override
  State<MostRecent> createState() => MostRecentState();
}

class MostRecentState extends State<MostRecent> {
  late double width;

  List<SuraDM> mostRecentSuras = [];

  void refreshMostRecent() async {
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .sizeOf(context)
        .width;
    return SizedBox(
      height: MediaQuery
          .sizeOf(context)
          .height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mostRecentSuras.length,
        itemBuilder: (_, index) => buildMostRecentCard(mostRecentSuras[index]),
      ),
    );
  }

  Widget buildMostRecentCard(SuraDM suraDm) {
    return mostRecentSuras.isEmpty ? Center(
      child: Text("No mostly recent suras", style: TextStyle(
          color: ColorsManager.gold,
          fontSize: 12,
          fontWeight: FontWeight.w500
      ),),
    )
        : Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    suraDm.suraNameEn,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    suraDm.suraNameAr,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${suraDm.verses} verses",
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
