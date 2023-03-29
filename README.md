# demo_package_pigeon

A Flutter project demo for package Pigeon.

## Feature
- Android native call rest api from [OpenWeather-API](https://openweathermap.org/api/one-call-3) and return Weather Response, throw FlutterError for any Exception.
- Flutter call native code to get response, handle exception.
- IOS source code for Pigeon [here](https://github.com/vfa-nhanbt/demo-pigeon-ios) including call native to get Response<String>, nothing else.

## Flutter
```dart
import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class WeatherApi {
  @async
  String getWeatherByCityName(String cityName);
}
```

## Android
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
[Demo Flutter call Android native](https://youtube.com/shorts/ZNFAhhg5eFI?feature=share)
