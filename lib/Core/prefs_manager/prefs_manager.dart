import 'package:islami_app/Core/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  // 1  2
  static void addSuraIndex(int suraIndex) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // create object and will call once first time
    List<String> mostRecentSuraIndex =
        prefs.getStringList("most_recent_sura_index") ??
        []; // with first index it will create empty list
    // [1,2,1]
    if (mostRecentSuraIndex.contains("$suraIndex")) {
      mostRecentSuraIndex.remove("$suraIndex"); //[2]
      mostRecentSuraIndex.add("$suraIndex"); //[2,1]
    } else {
      mostRecentSuraIndex.add("$suraIndex");
    }
    prefs.setStringList(
      "most_recent_sura_index",
      mostRecentSuraIndex,
    ); // save index in storage
  }

  static Future<List<SuraDM>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndex =
        prefs.getStringList("most_recent_sura_index") ?? [];
    //["1", "3", "6"]
    List<SuraDM> mostRecentList = [];

    for (int i = 0; i < mostRecentSuraIndex.length; i++) {
      int suraIndex = int.parse(mostRecentSuraIndex[i]);
      mostRecentList.add(
        ConstantsManager.quranSuras[suraIndex],
      ); // add first object in quranSuras, then third...
    }

    return mostRecentList.reversed
        .toList(); // reversed because it is arabic ==> [1,2]
  }
}
