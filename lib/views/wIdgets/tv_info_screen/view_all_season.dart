import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/const/api_key.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/models/movie_info_screen/movie_info/belongs_to_collection.dart';

class ViewAllSeasons extends StatelessWidget {
  int id;
  String? backGround;
  double maxWidth;
  int episodes;
  int season;
  double h10p;
  double w10p;

  ViewAllSeasons({
    super.key,
    this.backGround,
    required this.id,
    required this.maxWidth,
    required this.season,
    required this.episodes,
    required this.h10p,
    required this.w10p,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth - 8,
      height: h10p * 3,
      decoration: BoxDecoration(
          color: ELEMENT_COLOR, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(175, 0, 0, 0),
                        image: DecorationImage(
                          opacity: 0.4,
                          scale: 1,
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                imageUrl: backGround == null
                    ? 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/7f1f35167599083.642bf13a1def6.jpg'
                    : imageBase + backGround!,
                placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ROSE_COLOR,
                    )),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/Image_placeholder.jpg')),
          ),
          Padding(
            padding: EdgeInsets.all(w10p * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Season $season',
                  style: MoviexFontStyle.heading2(),
                ),
                SizedBox(
                  height: h10p * .1,
                ),
                SizedBox(
                  width: w10p * 7.7,
                  height: h10p * 1,
                  child: Text(
                    'Total Episodes $episodes',
                    style: const TextStyle(
                        color: Color.fromARGB(219, 255, 255, 255),
                        fontSize: 15),
                  ),
                ),
                TextButton(
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        backgroundColor: ROSE_COLOR, // <-- Button color
                        foregroundColor: Colors.black54 // <-- Splash color
                        ),
                    onPressed: () {
                      Get.toNamed('/SesonsScreen');
                    },
                    child: const Text(
                      'VIEW ALL SEASONS',
                      style: TextStyle(
                          color: WHITE_COLOR,
                          fontWeight: FontWeight.w500,
                          fontSize: 11),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
