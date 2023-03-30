import 'package:flutter/material.dart';

import 'widgets/video_player_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Video Player"),
          centerTitle: true,
        ),
        body: const VideoPlayerWidget(),
      ),
    );
  }
}
