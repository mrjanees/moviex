import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mspot/controllers/movie_info/trailer_controller.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/wIdgets/home_screen/percent_indicator.dart';
import 'package:mspot/views/wIdgets/movie_info/trailer_video_widg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../const/api_key.dart';
import '../../pages/home_screen/home_screen.dart';

class MainCard extends StatelessWidget {
  String moviekey;
  double vote;
  int duration;
  String releasedDate;
  String title;
  String? image;
  double w10p;
  double h10p;
  MainCard(
      {super.key,
      required this.moviekey,
      required this.vote,
      required this.h10p,
      required this.w10p,
      required this.image,
      required this.title,
      required this.releasedDate,
      required this.duration});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 295,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: w10p * 10,
            height: h10p * 3.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(image == null
                        ? 'https://mir-s3-cdn-cf.behance.net/projects/808/446036167599083.Y3JvcCwxMzgwLDEwODAsMjcwLDA.jpg'
                        : imageBase + image!)),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: h10p * 3.2,
                  width: w10p * 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            scale: 1,
                            image: imageProvider,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      imageUrl: image == null
                          ? 'https://mir-s3-cdn-cf.behance.net/projects/808/446036167599083.Y3JvcCwxMzgwLDEwODAsMjcwLDA.jpg'
                          : orgImage + image!,
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
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        title,
                        maxLines: 2,
                        style: MoviexFontStyle.heading2(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Science Fiction, Adventure, Action',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MoviexFontStyle.textUnderHeading2(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        releasedDate,
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
                      Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                              color: ELEMENT_COLOR,
                              borderRadius: BorderRadius.circular(15)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: ELEMENT_COLOR,
                                padding: EdgeInsets.zero),
                            onPressed: () {
                              YoutubePlayerController controller =
                                  YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                              moviekey)!);
                              videoTrailer(controller);
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  size: 30,
                                  color: WHITE_COLOR,
                                ),
                                Text(
                                  'Play Trailer',
                                  style: TextStyle(
                                      color: WHITE_COLOR, fontSize: 14),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: h10p * 0.1,
          ),
          SizedBox(
            height: h10p * 1,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: ELEMENT_COLOR,
                        padding: const EdgeInsets.all(8),
                        shape: const CircleBorder(),
                        child: SvgPicture.asset(
                          'assets/icons/heart.svg',
                          height: 26,
                          width: 26,
                          colorFilter: const ColorFilter.mode(
                              WHITE_COLOR, BlendMode.srcIn),
                        ),
                      ),
                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: ELEMENT_COLOR,
                        padding: const EdgeInsets.all(8),
                        shape: const CircleBorder(),
                        child: SvgPicture.asset(
                          'assets/icons/bookmark.svg',
                          height: 26,
                          width: 26,
                          colorFilter: const ColorFilter.mode(
                              WHITE_COLOR, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child:
                      PercentInticator(percent: vote, fontSIze: 13, radius: 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox Dot() {
    return SizedBox(
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            color: WHITE_COLOR, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);

  List<String> parts = d.toString().split(':');
  final val = '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(1, '0')}min';

  return val;
}
