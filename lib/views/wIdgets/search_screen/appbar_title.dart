import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 35,
            width: 55,
            child: Image.asset('assets/icons/App_Icon.png')),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 106,
            height: 26,
            child: Image.asset('assets/icons/Typograohy.png')),
      ],
    );
  }
}
