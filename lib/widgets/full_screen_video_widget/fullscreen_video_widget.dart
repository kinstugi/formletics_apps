// import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class FullScreenVideoPage extends StatefulWidget {
  final String videoSource;

  const FullScreenVideoPage({this.videoSource});

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  // CachedVideoPlayerController controller;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  bool isPlaying = false;

  @override
  void initState() {
    initializePlayer();
    super.initState();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoSource);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Chewie(controller: _chewieController),
            ),
          ),
          TextButton(
            onPressed: () {
              _chewieController.enterFullScreen();
            },
            child: const Text('Fullscreen'),
          ),

        ],
      ),
    );

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
