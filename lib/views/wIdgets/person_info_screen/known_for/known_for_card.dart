import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mspot/utils/dioerror_message.dart';
import 'package:mspot/views/pages/base_screen.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:mspot/views/pages/person_info_screen.dart';

import '../../../../const/api_key.dart';
import '../../../../controllers/movie_info/movie_info_controller.dart';
import '../../../../controllers/network/network_connectivity.dart';
import '../../../../core/colors/app_color.dart';
import '../../../dialogs/loding_circle.dart';

class KnownForCard extends StatelessWidget {
  int id;
  String? image;
  String title;
  KnownForCard(
      {super.key, required this.title, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (network == 'Online') {
          Get.close(pagesCloseNumber.value);
          loadingCircle();
          Get.put(MovieInfoController.instance.movieInfo(id));
        } else {
          DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
        }
      },
      child: SizedBox(
        height: 180,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              height: 200,
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
                  imageUrl: image == null
                      ? 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/79aca3169296177.644a1ddc03704.jpg'
                      : orgImage + image!,
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
              height: 10,
            ),
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                  color: WHITE_COLOR,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
