import 'package:flutter/material.dart';
import 'package:mspot/views/pages/pages.dart';
import 'package:mspot/views/wIdgets/bottom_navigation.dart';

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
            body: pages[pageindex],
            bottomNavigationBar: const CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }
}