import 'package:flutter/material.dart';
import 'package:mspot/const/colors/colors.dart';

class TvScreen extends StatelessWidget {
  TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tv_Screen',
        style: TextStyle(color: ROSE_COLOR),
      ),
    );
  }
}
