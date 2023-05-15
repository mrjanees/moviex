import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/utils/dateFormater.dart';
import 'package:mspot/utils/dioerror_message.dart';
import 'package:mspot/views/dialogs/loding_circle.dart';
import 'package:mspot/views/pages/base_screen.dart';
import 'package:mspot/views/wIdgets/home_screen/percent_indicator.dart';
import 'package:mspot/views/wIdgets/search_screen/app_bar_search.dart';
import '../../../const/api_key.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../controllers/network/network_connectivity.dart';
import '../../../controllers/person_info/person_info_controller.dart';
import '../../../controllers/tv_info/tv_info_controller.dart';

class SearchCard extends StatelessWidget {
  String? knownOfDepart;
  int id;
  double? vote;
  String? image;
  String title;
  String? releasDate;
  SearchCard(
      {super.key,
      this.knownOfDepart,
      required this.id,
      this.vote,
      required this.image,
      this.releasDate,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double maxHeight = constraints.maxHeight;
      double w1p = maxWidth * 0.01;

      return GestureDetector(
        onTap: () async {
          if (network == 'Online') {
            if (searchController.dropDownvalue.value == 0) {
              loadingCircle();
              await Get.put(MovieInfoController.instance.movieInfo(id));
            } else if (searchController.dropDownvalue.value == 1) {
              loadingCircle();
              Get.put(TvInfoController.instance.tvInfo(id));
            } else if (searchController.dropDownvalue.value == 2) {
              Get.put(PersonInfoController.instance.personInfo(id));
            }
          } else {
            DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
          }
        },
        child: Container(
          width: maxWidth - 60,
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(color: ELEMENT_COLOR),
              image: DecorationImage(
                  opacity: 0.3,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(image == null
                      ? 'https://mir-s3-cdn-cf.behance.net/projects/808/446036167599083.Y3JvcCwxMzgwLDEwODAsMjcwLDA.jpg'
                      : imageBase + image!)),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(175, 0, 0, 0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 110,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                            ? 'https://mir-s3-cdn-cf.behance.net/projects/808/446036167599083.Y3JvcCwxMzgwLDEwODAsMjcwLDA.jpg'
                            : imageBase + image!,
                        placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: ROSE_COLOR,
                            )),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/Image_placeholder.jpg')),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: WHITE_COLOR,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: releasDate == ""
                            ? false
                            : releasDate == null
                                ? false
                                : true,
                        child: Text(
                          releasDate == ""
                              ? 'N/A'
                              : releasDate == null
                                  ? 'N/A'
                                  : searchCardDate(releasDate!),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: WHITE_COLOR,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Visibility(
                        visible: knownOfDepart == null ? false : true,
                        child: Text(
                          knownOfDepart ?? 'Unknown Department',
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: WHITE_COLOR,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: w1p * 33),
                          child: Visibility(
                            visible: vote == 0.0 ? false : true,
                            child: PercentInticator(
                              percent: vote ?? 0.0,
                              fontSIze: 12,
                              radius: 20,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
