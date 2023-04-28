import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

videoTrailer(
    {required YoutubePlayerController controller, required double maxwidth}) {
  Get.dialog(
      Column(
        children: [
          Container(
              width: maxwidth == 360 ? maxwidth - 20 : 500,
              child: YoutubePlayer(controller: controller))
        ],
      ),
      barrierDismissible: false);
}
