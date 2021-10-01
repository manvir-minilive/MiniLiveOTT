import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SampleVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const SampleVideoPlayer({Key key, this.videoUrl}) : super(key: key);

  @override
  _SampleVideoPlayerState createState() => _SampleVideoPlayerState();
}

class _SampleVideoPlayerState extends State<SampleVideoPlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(widget.videoUrl)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            // setState(() {
            //   flickManager.getPlayerControlsTimeout;
            // });
          }));

    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //       "https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4"),
    // );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.amber,
        child: FlickVideoPlayer(flickManager: flickManager),
      ),
    );
  }
}
