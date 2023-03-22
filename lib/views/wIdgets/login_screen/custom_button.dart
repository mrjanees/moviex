import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: const MaterialStatePropertyAll(ELEMENT_COLOR)),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
