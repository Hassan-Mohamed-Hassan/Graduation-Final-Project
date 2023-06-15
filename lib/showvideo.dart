import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the video URL
    _controller = VideoPlayerController.network('http://192.168.43.200:8000/storage/files/teacherUploads/courses/videos/szKwCWnO8uvckYvX8kZxS144mAyw57Lar5hoqaRx.mp4');
    // Wait for the controller to finish initializing before calling setState
    _controller.initialize().then((_) {
      setState(() {});
      // Start playing the video once it has finished initializing
      _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Release the controller when the widget is disposed
    _controller.dispose();
  }
}