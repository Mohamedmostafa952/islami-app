import 'package:flutter/material.dart';
import 'package:islami_app/Core/colors_manager.dart';

class HadithContent extends StatelessWidget {
  const HadithContent({super.key, required this.hadithContent});

  final String hadithContent;

  @override
  Widget build(BuildContext context) {
    return Text(
      hadithContent,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      style: TextStyle(
        color: ColorsManager.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
