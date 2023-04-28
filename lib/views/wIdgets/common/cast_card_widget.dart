import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/api_key.dart';
import '../../../controllers/network/network_connectivity.dart';
import '../../../controllers/person_info/person_info_controller.dart';
import '../../../core/colors/app_color.dart';
import '../../../utils/dioerror_message.dart';
import '../../pages/base_screen.dart';

class CastCardWidget extends StatelessWidget {
  int id;
  String? avatar;
  String name;
  String? character;

  CastCardWidget(
      {super.key,
      required this.id,
      required this.avatar,
      required this.name,
      this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (network == 'Online') {
          pagesCloseNumber.value = 2;
          Get.put(PersonInfoController.instance.personInfo(id));
        } else {
          DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: 200,
              height: 240,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [ROSE_COLOR, ELEMENT_COLOR, BACKGROUND_COLOR],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              scale: 1,
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        imageUrl: profilePic(avatar),
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: ROSE_COLOR,
                          backgroundColor: ELEMENT_COLOR,
                        )),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: WHITE_COLOR,
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    character ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: WHITE_COLOR,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

String profilePic(String? image) {
  if (image == null) {
    return 'https://st3.depositphotos.com/6672868/13801/v/600/depositphotos_138013506-stock-illustration-user-profile-group.jpg';
  } else {
    return imageBase + image;
  }
}
