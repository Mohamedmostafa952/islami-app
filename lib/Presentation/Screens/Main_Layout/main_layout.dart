import 'package:flutter/material.dart';
import 'package:islami_app/Core/assets_manager.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/hadith/hadith.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/quran/quran.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/tasbih/tasbih.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/radio/radio_tab.dart';
import 'package:islami_app/Presentation/Screens/Main_Layout/tabs/time/pray_time.dart';

import '../../../Core/colors_manager.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<Widget> tabs = [Quran(), Hadith(), Tasbih(), RadioTab(), PrayTime()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      onTap: (newIndex) {
        setState(() {
          selectedIndex = newIndex;
        });
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.quranLogo, selectedIndex == 0),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.hadithIcons, selectedIndex == 1),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.sebhaIcon, selectedIndex == 2),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.radioIcon, selectedIndex == 3),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.timeIcon, selectedIndex == 4),
          label: "Time",
        ),
      ],
    );
  }

  Widget buildIcon(String iconPath, bool isSelected) {
    return isSelected
        ? Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: ColorsManager.black.withOpacity(0.6),
          ),
          child: ImageIcon(AssetImage(iconPath)),
        )
        : ImageIcon(AssetImage(iconPath));
  }
}
