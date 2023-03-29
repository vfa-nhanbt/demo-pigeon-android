import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class WeatherApi {
  @async
  String getWeatherByCityName(String cityName);
}
