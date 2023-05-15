import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/const/screen_type.dart';
import 'package:mspot/core/internet_images.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../controllers/network/network_connectivity.dart';
import '../../../core/colors/app_color.dart';
import '../../../utils/dioerror_message.dart';
import '../../dialogs/loding_circle.dart';
import '../../pages/home_screen/home_screen.dart';

class SliderImage extends StatelessWidget {
  Enum screenMode;
  double maxWidth;
  double h1p;
  double h10p;
  double w1p;
  double w10p;
  SliderImage(
      {super.key,
      required this.screenMode,
      required this.maxWidth,
      required this.h1p,
      required this.h10p,
      required this.w1p,
      required this.w10p});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(HomeControllers());
    });
    return LayoutBuilder(builder: (context, constraints) {
      return CarouselSlider.builder(
          carouselController: controller,
          itemCount: MoviexImage.upComoingMovieImage.length,
          itemBuilder: (context, index, realIndex) {
            final upcomingData = MoviexImage.upComoingMovieImage[index];
            return buildImage(
                id: upcomingData['id'],
                poster: upcomingData['poster'],
                title: upcomingData['title'] ?? '',
                release: upcomingData['release'],
                width: w1p,
                height: h10p,
                maxWidth: maxWidth);
          },
          options: CarouselOptions(
              aspectRatio: 4.3,
              height: 210,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 4),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  homecontrollers.onPageChanged(index)));
    });
  }

  Widget buildImage(
          {String? poster,
          required int id,
          required String title,
          required String release,
          required double width,
          required double height,
          required double maxWidth}) =>
      GestureDetector(
        onTap: () {
          if (network == 'Online') {
            loadingCircle();
            Get.put(MovieInfoController.instance.movieInfo(id));
          } else {
            DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
          }
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: screenMode == ScreenMode.portrait
                  ? maxWidth - 40
                  : maxWidth - 50,
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
                    imageUrl: poster ??
                        'https://mir-s3-cdn-cf.behance.net/project_modules/fs/7f1f35167599083.642bf13a1def6.jpg',
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ROSE_COLOR,
                      backgroundColor: ELEMENT_COLOR,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    left: width * 3,
                    top: screenMode == ScreenMode.portrait
                        ? height * 3
                        : height / 1.5,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Color.fromARGB(132, 0, 0, 0),
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
            )),
      );
}
