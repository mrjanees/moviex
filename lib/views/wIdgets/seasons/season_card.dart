import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/api_key.dart';
import '../../../core/Font_style.dart';
import '../../../core/colors/app_color.dart';
import '../../dialogs/loding_circle.dart';

class SeasonCard extends StatelessWidget {
  int episodeCount;
  int id;
  String? image;
  String title;
  String? releasDate;
  SeasonCard(
      {super.key,
      required this.episodeCount,
      required this.id,
      required this.image,
      required this.releasDate,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double maxHeight = constraints.maxHeight;
      double w1p = maxWidth * 0.01;

      return GestureDetector(
        onTap: () async {
          loadingCircle();
          Get.back();
        },
        child: Container(
          height: 150,
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
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 140,
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
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'First Air Date - ',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: WHITE_COLOR,
                                        fontWeight: FontWeight.w300),
                                    children: [
                                      TextSpan(
                                          text: releasDate,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: WHITE_COLOR,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                    text: 'Episodes - ',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: WHITE_COLOR,
                                        fontWeight: FontWeight.w300),
                                    children: [
                                      TextSpan(
                                          text: episodeCount.toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: WHITE_COLOR,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      )
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
