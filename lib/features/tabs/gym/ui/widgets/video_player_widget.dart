import 'package:flutter/material.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:formletics/widgets/full_screen_video_widget/fullscreen_video_widget.dart';


class CustomVideoPlayerWidget extends StatefulWidget {
  final String videoSource;


  const CustomVideoPlayerWidget({this.videoSource});

  @override
  _CustomVideoPlayerWidgetState createState() => _CustomVideoPlayerWidgetState();
}

class _CustomVideoPlayerWidgetState extends State<CustomVideoPlayerWidget> {
  CachedVideoPlayerController controller;

  @override
  void initState() {
    controller = CachedVideoPlayerController.network(widget.videoSource);
    controller.initialize().then((_){
      setState(() {});
      controller.setLooping(true);
      controller.setVolume(0.0);
      controller.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (controller.value != null && controller.value.initialized) {
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx)=> FullScreenVideoPage(videoSource: widget.videoSource,)
          ));
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedVideoPlayer(controller)
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
