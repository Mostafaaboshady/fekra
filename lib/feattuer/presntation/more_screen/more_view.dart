import 'package:fekra/core/utils/constants.dart';
import 'package:fekra/feattuer/presntation/more_screen/setting_body.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kbackgroundscreen,
      appBar: AppBar(
        backgroundColor: kboldcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // لتدوير الحواف السفلية
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.5,
        title: Text(
          "More",
          style: TextStyle(
              color: kwhitecolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),

      ),
      body: SettingBody(),
    ));
  }
}
