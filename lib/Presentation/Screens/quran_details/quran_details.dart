import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/constants_manager.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/quran/widgets/sura_content.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late SuraDM args;
  String suraContent = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as SuraDM;
    loadSuraContent(args.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(args.suraNameEn)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.quranDetailsPatternLeft),
                    Image.asset(AssetsManager.quranDetailsPatternRight),
                  ],
                ),
                Text(
                  args.suraNameAr,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Expanded(child: suraContent.isEmpty
                ? Center(
                child: CircularProgressIndicator(color: ColorsManager.gold,))
                : SuraContent(suraContent: suraContent),
            ),
            Image.asset(AssetsManager.quranBottomBackGround),
          ],
        ),
      ),
    );
  }

  void loadSuraContent(int suraIndex) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/suras/$suraIndex.txt",
    );
    List<String> suraLines = fileContent.trim().split("\n"); // list of strings
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}] ";
    }
    suraContent =
        suraLines
            .join(); // converting it like first, but with index in the end of the line now it is string
    setState(() {});
  }
}

