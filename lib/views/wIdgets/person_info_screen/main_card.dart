import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import '../../../const/api_key.dart';

class PersonInfoMainCard extends StatelessWidget {
  String? alsoKnownAs;
  String? knownFor;
  String? birthDate;
  String? birthPlace;
  String name;
  String? image;
  double w10p;
  double h10p;
  PersonInfoMainCard({
    super.key,
    required this.alsoKnownAs,
    required this.birthDate,
    required this.birthPlace,
    required this.knownFor,
    required this.name,
    required this.h10p,
    required this.w10p,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 340,
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: 150,
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
                      name,
                      maxLines: 2,
                      style: MoviexFontStyle.heading2(),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                          text: 'Also Known',
                          style: const TextStyle(
                              fontSize: 14,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.w500),
                          children: [TextSpan(text: alsoKnownAs)]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                          text: 'Know For',
                          style: const TextStyle(
                              fontSize: 14,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.w500),
                          children: [TextSpan(text: knownFor)]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                          text: 'Birth day',
                          style: const TextStyle(
                              fontSize: 14,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.w500),
                          children: [TextSpan(text: birthDate)]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                          text: 'Birth place',
                          style: const TextStyle(
                              fontSize: 14,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.w500),
                          children: [TextSpan(text: birthPlace)]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
