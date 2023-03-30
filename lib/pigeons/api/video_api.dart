import 'package:pigeon/pigeon.dart';

class VideoInfo {
  String? title;
  double? length;
}

class Video {
  VideoInfo? videoInfo;
  Uint8List? bytes;
}

@HostApi()
abstract class VideoApi {
  Video sendVideoFromNative();
}
