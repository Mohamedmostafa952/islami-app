import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/routes_manager/app_routes.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/hadith/widgets/hadithContent.dart';

class HadithCard extends StatefulWidget {
  const HadithCard({super.key, required this.index});

  final int index;

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  HadithDm? hadithDm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithContent();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadithDetails,
          arguments: hadithDm,
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(AssetsManager.hadithCardBackground),
          ),
          color: ColorsManager.gold,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsManager.quranDetailsPatternLeft,
                      color: ColorsManager.black,
                    ),
                    Image.asset(
                      AssetsManager.quranDetailsPatternRight,
                      color: ColorsManager.black,
                    ),
                  ],
                ),
                hadithDm != null
                    ? Text(
                      hadithDm!.title,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )
                    : Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.black,
                      ),
                    ),
              ],
            ),
            Expanded(
              child:
                  hadithDm != null
                      ? HadithContent(hadithContent: hadithDm!.content)
                      : Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.black,
                        ),
                      ),
            ),
            Image.asset(AssetsManager.mosque),
          ],
        ),
      ),
    );
  }

  void loadHadithContent() async {
    String filePath = "assets/files/Hadeeth/Hadeeth/h${widget.index}.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.trim().split("\n");
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    hadithDm = HadithDm(title: title, content: hadithLines.join());
    setState(() {});
  }
}

class HadithDm {
  String title;
  String content;

  HadithDm({required this.title, required this.content});
}
