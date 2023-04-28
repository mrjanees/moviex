import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mspot/core/colors/app_color.dart';

enum Type { username, password }

TextEditingController usernamecontroller = TextEditingController();
ValueNotifier<bool> visibleNotifier = ValueNotifier(false);

class LoginTextFormField extends StatelessWidget {
  String hinttext;
  String iconName;

  TextEditingController controller;
  Type type;

  LoginTextFormField({
    super.key,
    required this.type,
    required this.hinttext,
    required this.iconName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: visibleNotifier,
        builder: (context, _visible, child) {
          return TextFormField(
            enableInteractiveSelection: type == Type.password ? false : true,
            controller: controller,
            obscureText: type == Type.password
                ? _visible
                    ? false
                    : true
                : false,
            style: const TextStyle(color: WHITE_COLOR),
            decoration: InputDecoration(
                suffixIcon: type == Type.password
                    ? InkWell(
                        onTap: () {
                          visibleNotifier.value = !visibleNotifier.value;
                        },
                        child: Icon(
                          _visible ? Icons.visibility_off : Icons.visibility,
                          color: WHITE_COLOR,
                        ),
                      )
                    : null,
                prefixIcon: SvgPicture.asset(
                  iconName,
                  height: 10,
                  width: 10,
                  fit: BoxFit.scaleDown,
                  colorFilter:
                      const ColorFilter.mode(WHITE_COLOR, BlendMode.srcIn),
                ),
                prefixIconColor: WHITE_COLOR,
                isDense: true,
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ELEMENT_COLOR),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: WHITE_COLOR),
                    borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ROSE_COLOR),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ROSE_COLOR),
                    borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: ELEMENT_COLOR,
                errorStyle: const TextStyle(color: ROSE_COLOR),
                hintText: hinttext,
                hintStyle: const TextStyle(color: WHITE_COLOR)),
            validator: (value) {
              if (type == Type.username && value!.isEmpty) {
                return 'Enter the username';
              } else if (type == Type.password && value!.isEmpty) {
                return 'Enter the password';
              }
            },
          );
        });
  }
}
