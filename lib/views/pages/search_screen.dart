import 'package:flutter/material.dart';
import 'package:mspot/const/colors/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search_Screen',
        style: TextStyle(color: ROSE_COLOR),
      ),
    );
  }
}
