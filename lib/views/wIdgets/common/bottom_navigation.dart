import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

ValueNotifier<int> pageIndex = ValueNotifier(0);

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, newvalue, Widget? child) {
          return CustomNavigationBar(
            onTap: (value) {
              pageIndex.value = value;
            },
            currentIndex: newvalue,
            backgroundColor: ELEMENT_COLOR,
            borderRadius: const Radius.circular(20),
            items: [
              CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
                colorFilter:
                    pageIndex.value == 0 ? filterRoseColor : filterWhiteColor,
              )),
              CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                'assets/icons/search.svg',
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
                colorFilter:
                    pageIndex.value == 1 ? filterRoseColor : filterWhiteColor,
              )),
              CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                'assets/icons/film.svg',
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
                colorFilter:
                    pageIndex.value == 2 ? filterRoseColor : filterWhiteColor,
              )),
              CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
                colorFilter:
                    pageIndex.value == 3 ? filterRoseColor : filterWhiteColor,
              ))
            ],
          );
        },
      ),
    );
  }
}
