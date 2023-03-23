import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/Font_style.dart';
import '../../../core/colors/app_color.dart';
import '../home_screen/percent_indicator.dart';

class MovieCardTemplate extends StatelessWidget {
  String heading;
  String image;
  MovieCardTemplate({super.key, required this.heading, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => print('clicked'),
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
                        imageUrl: image,
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
                    child: PercentInticator(percent: 60),
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
                    overflow: TextOverflow.clip,
                    color: WHITE_COLOR,
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '12 jan',
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    color: WHITE_COLOR,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
