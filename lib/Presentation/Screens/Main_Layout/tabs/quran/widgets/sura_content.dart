import 'package:flutter/material.dart';
import 'package:islami_app/Core/colors_manager.dart';

class SuraContent extends StatelessWidget {
  const SuraContent({super.key, required this.suraContent});

  final String suraContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Text(
          suraContent,
          textDirection: TextDirection.rtl,
          style: TextStyle(color: ColorsManager.gold, fontSize: 18),
        ),
      ),
    );
  }
}
