import 'package:display_app/models/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatelessWidget {
  const VideoContent({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(video.link) ?? "";
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    return Container(
      margin: const EdgeInsets.only(left: 4),
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        // onReady: () {
        //   _controller.addListener(listener);
        // },
      ),
    );
  }
}
