import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mspot/controllers/movie_info/trailer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/colors/app_color.dart';

videoTrailer(YoutubePlayerController controller) {
  Get.dialog(
      Column(
        children: [YoutubePlayer(controller: controller)],
      ),
      barrierDismissible: false);
}
