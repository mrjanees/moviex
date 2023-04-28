import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/const/api_key.dart';
import 'package:mspot/views/pages/base_screen.dart';

import '../../../controllers/network/network_connectivity.dart';
import '../../../controllers/person_info/person_info_controller.dart';
import '../../../core/colors/app_color.dart';
import '../../../utils/dioerror_message.dart';

class ActorCardTemplate extends StatelessWidget {
  String? avatar;
  String name;
  int id;

  ActorCardTemplate(
      {super.key, required this.avatar, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (network == 'Online') {
          pagesCloseNumber.value = 1;
          Get.put(PersonInfoController.instance.personInfo(id));
        } else {
          DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
        }
      },
      child: SizedBox(
        height: 250,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
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
              maxLines: 2,
              style: const TextStyle(
                  overflow: TextOverflow.clip,
                  color: WHITE_COLOR,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

String profilePic(String? image) {
  if (image == null) {
    return 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/2018-01-11_Yasser_Hareb.jpg/1200px-2018-01-11_Yasser_Hareb.jpg';
  } else {
    return imageBase + image;
  }
}
