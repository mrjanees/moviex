import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import '../../../const/api_key.dart';

class CollectionMainCard extends StatelessWidget {
  double maxWidth;
  double maxHeight;
  String? backgroundImg;
  int movieId;
  String title;
  String overview;
  String? image;
  double w10p;
  double h10p;
  CollectionMainCard({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.backgroundImg,
    required this.overview,
    required this.movieId,
    required this.h10p,
    required this.w10p,
    required this.image,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth - 16,
      height: maxHeight / 2.2,
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
                    image: NetworkImage(backgroundImg == null
                        ? imageBase + image!
                        : imageBase + backgroundImg!)),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
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
                        height: 25,
                      ),
                      Text(
                        title,
                        maxLines: 2,
                        style: MoviexFontStyle.heading2(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        overview,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: MoviexFontStyle.textUnderHeading2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
