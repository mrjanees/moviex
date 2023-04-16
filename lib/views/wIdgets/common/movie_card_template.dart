import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/movie_info/movie_info_controller.dart';
import '../../../const/api_key.dart';
import '../../../core/colors/app_color.dart';
import '../../../utils/dateFormater.dart';
import '../../dialogs/loding_circle.dart';
import '../home_screen/percent_indicator.dart';

class MovieCardTemplate extends StatelessWidget {
  int movieId;
  String heading;
  String? image;
  String? relDate;
  double vote;
  MovieCardTemplate(
      {super.key,
      required this.movieId,
      required this.heading,
      required this.image,
      required this.relDate,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          loadingCircle();
          await Get.put(MovieInfoController.instance.movieInfo(movieId));
          Get.toNamed('/MovieInfo');
        },
        child: SizedBox(
          height: 250,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                        imageUrl: image == null
                            ? 'https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg'
                            : imageBase + image!,
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
                  Positioned(
                    top: 150,
                    left: 110,
                    child: PercentInticator(
                      percent: vote,
                      fontSIze: 12,
                      radius: 22,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                heading,
                maxLines: 1,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: WHITE_COLOR,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                relDate == null ? 'N/A' : dateFormater(relDate!),
                style: const TextStyle(
                    overflow: TextOverflow.clip,
                    color: WHITE_COLOR,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ));
  }
}
