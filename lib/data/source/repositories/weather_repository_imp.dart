// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../base/base_failure.dart';
import '../../responses/weather_response.dart';
import '../remote/weather_remote_data_source.dart';
import 'weather_repository.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImp implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<BaseFailure, WeatherResponse>> getWeatherByCityName(
      String cityName) async {
    return remoteDataSource.getWeatherByCityName(cityName);
  }
}
