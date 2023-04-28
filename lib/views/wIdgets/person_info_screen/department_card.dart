import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/pages/base_screen.dart';

import '../../../const/api_key.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../controllers/network/network_connectivity.dart';
import '../../../controllers/routing/page_closing_controller.dart';
import '../../../utils/dioerror_message.dart';
import '../../dialogs/loding_circle.dart';

class DepartmentCard extends StatelessWidget {
  int id;
  String? job;
  String? title;
  String? poster;
  String? releaseDate;
  DepartmentCard(
      {super.key,
      required this.id,
      required this.job,
      required this.releaseDate,
      required this.poster,
      required this.title});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {},
    );
    return Obx(() {
      final closingPages = pagesCloseNumber.value;
      return GestureDetector(
        onTap: () {
          if (network == 'Online') {
            Get.close(closingPages);
            loadingCircle();
            Get.put(MovieInfoController.instance.movieInfo(id));
          } else {
            DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
          }
        },
        child: Container(
          height: 60,
          width: 346,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                ELEMENT_COLOR,
                Color.fromARGB(255, 197, 31, 86),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  releaseDate == null ? 'no date' : releaseDate!.split('-')[0],
                  style: const TextStyle(
                      color: WHITE_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: WHITE_COLOR),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: WHITE_COLOR,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        job ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                            color: WHITE_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
