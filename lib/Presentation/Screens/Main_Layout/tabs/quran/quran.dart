import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Core/colors_manager.dart';
import 'package:islami_app/Core/constants_manager.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/quran/widgets/most_recent_sura_item.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/quran/widgets/sura_widget.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranTabBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.islamiLogo),
              buildTextField(),
              SizedBox(height: 10),
              Text(
                "Most Recently",
                style: TextStyle(
                  color: ColorsManager.offWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (_, _) => MostRecentSuraItem(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sura List",
                style: TextStyle(
                  color: ColorsManager.offWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:
                    (_, index) =>
                        SuraWidget(suraDM: ConstantsManager.quranSuras[index]),
                separatorBuilder:
                    (_, _) => Divider(
                      color: ColorsManager.white,
                      endIndent: 64,
                      indent: 64,
                      thickness: 1,
                    ),
                itemCount: ConstantsManager.quranSuras.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextField(
      cursorColor: ColorsManager.offWhite,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: ColorsManager.offWhite,
      ),
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: ColorsManager.offWhite,
        ),
        prefixIcon: ImageIcon(
          AssetImage(AssetsManager.searchQuranIcon),
          color: ColorsManager.gold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.gold, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.gold, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.red, width: 1),
        ),
      ),
    );
  }
}
