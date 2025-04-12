import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/hadith/widgets/hadithCard.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadithDm hadithDm;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    hadithDm = ModalRoute.of(context)!.settings.arguments as HadithDm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
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
                hadithDm.title,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadithDm.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Image.asset(AssetsManager.quranBottomBackGround),
        ],
      ),
    );
  }
}
