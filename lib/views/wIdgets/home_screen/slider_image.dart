import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/colors/app_color.dart';
import '../../../core/internet_images.dart';
import '../../pages/home_screen/home_screen.dart';

class SliderImage extends StatelessWidget {
  double h1p;
  double h10p;
  double w1p;
  double w10p;
  SliderImage(
      {super.key,
      required this.h1p,
      required this.h10p,
      required this.w1p,
      required this.w10p});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return CarouselSlider.builder(
          carouselController: controller,
          itemCount: MoviexImage.upComoingMovieImage.length,
          itemBuilder: (context, index, realIndex) {
            final image = MoviexImage.upComoingMovieImage[index];
            return buildImage(
              image['poster']!,
              image['title']!,
              image['release']!,
              index,
              w1p,
              h10p,
            );
          },
          options: CarouselOptions(
              height: 210,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 4),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  homecontrollers.onPageChanged(index)));
    });
  }
}

buildImage(String poster, String title, String release, int index, double width,
        double height) =>
    ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 280,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                imageUrl: poster,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: ROSE_COLOR,
                  backgroundColor: ELEMENT_COLOR,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                left: width * 3,
                top: height * 3,
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        color: Colors.black,
                        offset: Offset(10, 10))
                  ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: WHITE_COLOR),
                      ),
                      Text(
                        release,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: WHITE_COLOR),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
