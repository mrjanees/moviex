import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/api_key.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../core/colors/app_color.dart';
import '../../../utils/dateFormater.dart';

class ProfileCard extends StatelessWidget {
  int movieId;
  String heading;
  String? image;
  String? relDate;
  double vote;
  ProfileCard(
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
          await Get.put(MovieInfoController.instance.movieInfo(movieId));
          Get.toNamed('/MovieInfo');
        },
        child: SizedBox(
          height: 150,
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                heading,
                maxLines: 2,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: WHITE_COLOR,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                relDate == null ? 'N/A' : dateFormater(relDate!),
                style: const TextStyle(
                    overflow: TextOverflow.clip,
                    color: WHITE_COLOR,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
