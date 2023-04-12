import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mspot/controllers/search/search_controllers.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';

import 'package:mspot/views/wIdgets/search_screen/search_card.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/utils/dateFormater.dart';
import 'package:mspot/views/wIdgets/home_screen/percent_indicator.dart';
import '../../../const/api_key.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../core/Font_style.dart';
import '../../../utils/genres_id_converter.dart';
import '../movie_info/main_card_widg.dart';

final searchControllers = Get.put(SearchControllers());

class MovieCollextions extends StatelessWidget {
  const MovieCollextions({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final collections =
              movieInfoController.movieCollections.value.parts![index];
          return CollectionsCard(
            genres: genresIdIntoGeresName(collections.genreId!),
            duration: 192,
            id: collections.id!,
            image: collections.posterPath,
            releasDate: collections.releaseDate,
            title: collections.title!,
            vote: collections.voteAverage!,
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemCount: movieInfoController.movieCollections.value.parts!.length);
  }
}

class CollectionsCard extends StatelessWidget {
  String genres;
  int duration;
  int id;
  double vote;
  String? image;
  String title;
  String? releasDate;
  CollectionsCard(
      {super.key,
      required this.genres,
      required this.duration,
      required this.id,
      required this.vote,
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
          await Get.put(MovieInfoController.instance.movieInfo(id));
          Get.toNamed('/MovieInfo');
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
                      Text(
                        genres,
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: WHITE_COLOR,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400),
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
                              Text(
                                releasDate!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MoviexFontStyle.textUnderHeading2(),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                durationToString(duration),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MoviexFontStyle.textUnderHeading2(),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: PercentInticator(
                                percent: vote, fontSIze: 13, radius: 20),
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
