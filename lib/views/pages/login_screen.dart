import 'package:flutter/material.dart';
import 'package:mspot/controllers/authentication/auth_controller.dart';

import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/controllers/login/login_controllers.dart';
import 'package:mspot/core/urls/login/login_urls.dart';
import 'package:mspot/views/pages/base_screen.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/login_screen/custom_button.dart';
import 'package:mspot/views/wIdgets/login_screen/textformfield.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dialogs/success_snackbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? sessionId;
  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxWidth * 0.1;
      double w1p = maxHeight * 0.01;
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background_image/new.jpg"),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: h10p * 4,
                    bottom: h1p * 1.5,
                    left: w1p * 5,
                    right: w1p * 5),
                child: SingleChildScrollView(
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              fontFamily: 'Inter'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        LoginTextFormField(
                          type: Type.username,
                          hinttext: 'username',
                          iconName: 'assets/icons/user.svg',
                          controller: usernameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        LoginTextFormField(
                            controller: passwordController,
                            type: Type.password,
                            hinttext: 'password',
                            iconName: 'assets/icons/lock.svg'),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: CustomButton(
                            text: 'Login',
                            onPressed: () async {
                              if (formGlobalKey.currentState!.validate()) {
                                final sessionId =
                                    await LoginControllers.loginButton(
                                        usernameController.text,
                                        passwordController.text);
                                usernameController.clear();
                                passwordController.clear();
                                if (sessionId != null) {
                                  Get.put(AuthController.instance.login());
                                  Get.offAllNamed('/');
                                  successSnackbar(
                                      'Login Success!',
                                      'you have successfully logged in...',
                                      Icons.check_circle_outline_rounded,
                                      Colors.green,
                                      Colors.white);
                                } else {
                                  print('Sessionid is null');
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'need an account?',
                              style: TextStyle(color: WHITE_COLOR),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Link(
                              uri: signUpUrl,
                              builder: (context, followLink) => InkWell(
                                  onTap: () {
                                    _launchUrl();
                                  },
                                  child: const Text('Sign-up',
                                      style: TextStyle(
                                          color: WHITE_COLOR,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(signUpUrl)) {
    throw Exception('Could not launch $signUpUrl');
  }
}
