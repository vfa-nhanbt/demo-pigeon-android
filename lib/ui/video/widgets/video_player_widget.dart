import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../config/app_dimensions.dart';
import '../../../pigeons/generated/video_pigeon.dart';
import '../../../uils/utils.dart';
import 'video_info_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  Video? video;
  late final VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isInit = true;

  Future<void> _initializePlayer() async {
    video = await VideoApi().sendVideoFromNative();
    final file = await Utils.instance.fileFromAssets("videos/temp.mp4");
    await file.writeAsBytes(video!.bytes!);

    _controller = VideoPlayerController.file(file);

    await _controller.initialize();
    setState(() {
      _isInit = false;
    });

    _chewieController = ChewieController(
      placeholder: Container(
        color: Colors.black87,
        height: double.infinity,
        width: double.infinity,
      ),
      subtitleBuilder: (_, subtitle) => Container(
        child: subtitle,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.horizontalMargin,
        ),
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.horizontalMargin,
          vertical: AppDimensions.verticalMargin,
        ),
      ),
      videoPlayerController: _controller,
      allowFullScreen: true,
      allowedScreenSleep: true,
      allowMuting: true,
      showControlsOnInitialize: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      allowPlaybackSpeedChanging: true,
      optionsTranslation: OptionsTranslation(
        subtitlesButtonText: 'cc',
        cancelButtonText: 'cancel',
        playbackSpeedButtonText: 'playback',
      ),
    );
  }

  @override
  void initState() {
    _initializePlayer();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Colors.white30,
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black54,
                height: 0.36.sh,
                width: double.infinity,
                child: Center(
                  child: Chewie(controller: _chewieController!),
                ),
              ),
              SizedBox(height: AppDimensions.heightSpacer),
              VideoInfoWidget(
                title: "Video Title:",
                content: video?.videoInfo?.title,
              ),
              SizedBox(height: AppDimensions.heightSpacer),
              VideoInfoWidget(
                title: "Video Length:",
                content: "${video?.videoInfo?.length} seconds",
              ),
            ],
          );
  }
}
