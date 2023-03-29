import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../base/base_failure.dart';
import '../../base/base_sore_state.dart';
import '../../data/responses/weather_main.dart';
import '../../data/responses/weather_response.dart';
import 'home_use_case.dart';

part 'home_store.g.dart';

@injectable
class HomeStore extends _HomeStore with _$HomeStore {
  HomeStore(GetWeatherUseCase getWeatherUseCase) : super(getWeatherUseCase);
}

abstract class _HomeStore with Store {
  final GetWeatherUseCase getWeatherUseCase;

  _HomeStore(this.getWeatherUseCase);

  @observable
  ObservableFuture<Either<BaseFailure, WeatherResponse>>? _weatherFuture;

  @observable
  WeatherResponse? weather;

  @observable
  String? errorMessage;

  @computed
  BaseStoreState get state {
    if (_weatherFuture == null) {
      return BaseStoreState.initial;
    }
    if (_weatherFuture!.status == FutureStatus.rejected) {
      return BaseStoreState.error;
    }
    return _weatherFuture!.status == FutureStatus.pending
        ? BaseStoreState.loading
        : BaseStoreState.loaded;
  }

  @action
  Future getWeatherByCityName(String cityName) async {
    errorMessage = null;

    /// Call get weather use case and return either failure or weather
    /// Use [_weatherFuture] instead of [weather] to automatically update `state`
    _weatherFuture = ObservableFuture(
      getWeatherUseCase(
        GetWeatherParams(
          cityName
            ..replaceAll(" ", "")
            ..toLowerCase(),
        ),
      ),
    );
    final Either<BaseFailure, WeatherResponse>? weatherOrFail =
        await _weatherFuture;

    if (weatherOrFail == null) {
      return weather = WeatherResponse(
        id: "id",
        name: "weather error!",
        timezone: 0,
        main: const WeatherMain(temp: 0),
      );
    }

    /// Handle the return value of repository and update error message via Dartz, Equatable package
    return weatherOrFail.fold(
      (l) => l is ServerFailure
          ? errorMessage = l.message
          : errorMessage = "Unexpected Error",
      (r) => weather = r,
    );
  }
}
