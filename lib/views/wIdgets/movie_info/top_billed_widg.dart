import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import '../../../const/api_key.dart';
import '../../../controllers/movie_info/movie_info_controller.dart';
import '../../../core/colors/app_color.dart';

class TopBilled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieInfoController.topBilledList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        final cast = movieInfoController.topBilledList[index];
        return CastCardWidget(
          avatar: cast.profilePath,
          name: cast.name!,
          character: cast.character!,
        );
      },
    );
  }
}

class CastCardWidget extends StatelessWidget {
  String? avatar;
  String name;
  String character;

  CastCardWidget(
      {super.key,
      required this.avatar,
      required this.name,
      required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('clicked'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: 200,
              height: 240,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ROSE_COLOR, ELEMENT_COLOR, BACKGROUND_COLOR],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
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
                        imageUrl: profilePic(avatar),
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
                    height: 5,
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: WHITE_COLOR,
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    character,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: WHITE_COLOR,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

String profilePic(String? image) {
  if (image == null) {
    return 'https://st3.depositphotos.com/6672868/13801/v/600/depositphotos_138013506-stock-illustration-user-profile-group.jpg';
  } else {
    return imageBase + image;
  }
}
