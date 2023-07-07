import 'package:flutter/material.dart';
import 'package:weathertime/utilities/TextWidget.dart';
import 'package:weathertime/utilities/screens/Colors/colors.dart';

class HiddenMenu extends StatefulWidget {
  const HiddenMenu({super.key});

  @override
  State<HiddenMenu> createState() => _HiddenMenuState();
}

class _HiddenMenuState extends State<HiddenMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BlackBackground,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Center(
            child: SafeArea(
                child: TextWidget(
              text: "try",
              size: 30,
              color: AppColors.AppWhite,
            )),
          )
        ]),
      ),
    );
  }
}
