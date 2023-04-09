import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:mspot/core/colors/app_color.dart';

class ServerPageController extends StatelessWidget {
  double width;
  double height;
  int page;
  VoidCallback pageIncrement;
  VoidCallback pageDecrement;

  ServerPageController(
      {super.key,
      required this.height,
      required this.width,
      required this.page,
      required this.pageDecrement,
      required this.pageIncrement});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double w1p = constraints.maxWidth * 0.01;

      return SizedBox(
        child: Row(
          children: [
            IconButton(
                iconSize: 27,
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  pageDecrement();
                },
                icon: const Icon(Icons.arrow_back, color: WHITE_COLOR)),
            SizedBox(
              width: width * 2,
            ),
            Text(
              'Page : $page',
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: WHITE_COLOR),
            ),
            SizedBox(
              width: width * 2,
            ),
            IconButton(
                iconSize: 27,
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  pageIncrement();
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: WHITE_COLOR,
                ))
          ],
        ),
      );
    });
  }
}
