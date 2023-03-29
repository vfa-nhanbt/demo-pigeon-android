import 'package:dartz/dartz.dart';

import '../../../base/base_failure.dart';
import '../../responses/weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<Either<BaseFailure, WeatherResponse>> getWeatherByCityName(
      String cityName);
}
