import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class YoutubeTrailerPlayer extends StatelessWidget {
  YoutubePlayerController controller;
  String name;
  YoutubeTrailerPlayer({super.key, required this.controller,required this.name});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fill,
                child: YoutubePlayer(
                  controller: controller,
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
            ),
            body:  Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fill,
                child: YoutubePlayer(
                  controller: controller,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

