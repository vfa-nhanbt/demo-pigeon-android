# demo_package_pigeon

A Flutter project demo for package Pigeon.

## Feature

- Android native:
  - Call open rest api from [OpenWeather-API](https://openweathermap.org/api/one-call-3).
  - Handling network response, error, exception.
  - Load video from assets and convert to byte array.
- Flutter:
  - Call native code via package [Pigeon](https://pub.dev/packages/pigeon).
  - Return custom Object values.
  - Load video player from uint8List(get from native byte array response).
- IOS source code for Pigeon [here](https://github.com/vfa-nhanbt/demo-pigeon-ios) including call native to get Response<String>, nothing else.

## Flutter

- Pigeon input file

```dart
import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class WeatherApi {
  @async
  String getWeatherByCityName(String cityName);
}
```

- Pigeon custom Object sample usage

```dart
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
```

## Android

- Sample implement of Pigeon in native

```kotlin
 WeatherApi.setup(
            flutterEngine.dartExecutor.binaryMessenger,
            WeatherPlatformApi(repository)
 )

 class WeatherPlatformApi(repository: IWeatherRepository) : WeatherApi {
 ...
 }
```

## Demo

[Demo Flutter call Android native](https://www.youtube.com/shorts/p3s4OPAIdew)
