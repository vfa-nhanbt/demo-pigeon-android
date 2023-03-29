import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../base/base_failure.dart';
import '../../base/base_use_case.dart';
import '../../data/responses/weather_response.dart';
import '../../data/source/repositories/weather_repository.dart';

@lazySingleton
class GetWeatherUseCase implements UseCase<WeatherResponse, GetWeatherParams> {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  @override
  Future<Either<BaseFailure, WeatherResponse>> call(
          GetWeatherParams params) async =>
      repository.getWeatherByCityName(params.cityName);
}

class GetWeatherParams extends Equatable {
  final String cityName;

  const GetWeatherParams(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
