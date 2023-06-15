import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatelessWidget {
  final String video;
  final FlickManager flickManager;
  ShowVideo(this.video) : flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network('http://192.168.43.200:8000/storage/files/teacherUploads/$video')
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),

      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: FlickVideoPlayer(flickManager:flickManager,),
        ),
      ),
    );
  }
}
