import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class ActorCardTemplate extends StatelessWidget {
  String avatar;
  String name;
  ActorCardTemplate({super.key, required this.avatar, required this.name});

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
                  imageUrl: avatar,
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
                  overflow: TextOverflow.clip,
                  color: WHITE_COLOR,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
