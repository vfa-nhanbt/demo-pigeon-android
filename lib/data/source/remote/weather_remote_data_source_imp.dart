import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../base/base_failure.dart';
import '../../../pigeons/generated/weather_pigeon.dart';
import '../../responses/weather_response.dart';
import 'weather_remote_data_source.dart';

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
  @override
  Future<Either<BaseFailure, WeatherResponse>> getWeatherByCityName(
      String cityName) async {
    try {
      final response = await WeatherApi().getWeatherByCityName(cityName);

      // final result = BaseResult<WeatherResponse>.fromJson(
      //   response,
      //   WeatherResponse(),
      // );

      // if (result.error?.isEmpty ?? true) {
      //   throw Exception(result.error);
      // }

      final result = WeatherResponse().fromJson(response);

      return Right(result);
    } catch (e) {
      if (e is PlatformException) {
        return left(ServerFailure(e.message ?? e.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
