import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/pages/screens.dart';
import 'package:mspot/views/wIdgets/common/bottom_navigation.dart';

class BaseScreen extends StatelessWidget {
  String? sessionId;
  BaseScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (BuildContext context, pageindex, Widget? child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: BACKGROUND_COLOR,
            body: screens[pageindex],
            bottomNavigationBar: const CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
