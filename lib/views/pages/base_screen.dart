import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:mspot/controllers/authentication/auth_controller.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/views/pages/login_screen.dart';
import 'package:mspot/views/pages/screens.dart';

import '../../core/colors/app_color.dart';
import '../wIdgets/common/bottom_navigation.dart';

class BaseScreen extends StatelessWidget {
  String? sessionId;
  BaseScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: ELEMENT_COLOR,
              title: const Text(
                'Are you sure?',
                style: TextStyle(color: WHITE_COLOR, fontFamily: 'Inter'),
              ),
              content: const Text(
                'Do you want to exit the app?',
                style: TextStyle(color: WHITE_COLOR, fontFamily: 'Inter'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No',
                      style:
                          TextStyle(color: WHITE_COLOR, fontFamily: 'Inter')),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes',
                      style:
                          TextStyle(color: WHITE_COLOR, fontFamily: 'Inter')),
                ),
              ],
            ),
          );
        },
        child: ValueListenableBuilder(
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
        ));
  }
}
