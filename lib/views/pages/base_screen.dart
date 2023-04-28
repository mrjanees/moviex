import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/screens.dart';
import '../../controllers/network/network_connectivity.dart';
import '../../controllers/routing/page_closing_controller.dart';
import '../../core/colors/app_color.dart';
import '../wIdgets/common/bottom_navigation.dart';

final pagesCloseNumber = Get.put(PageClosingController().pagesCloseNumber);

class BaseScreen extends StatelessWidget {
  String? sessionId;
  BaseScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.put(PageClosingController().pagesCloseNumber);
        NetworkConnectivity.instance.connectionListener();
      },
    );
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
