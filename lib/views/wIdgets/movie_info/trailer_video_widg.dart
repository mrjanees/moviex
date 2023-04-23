import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

videoTrailer(YoutubePlayerController controller) {
  Get.dialog(
      Column(
        children: [YoutubePlayer(controller: controller)],
      ),
      barrierDismissible: false);
}
