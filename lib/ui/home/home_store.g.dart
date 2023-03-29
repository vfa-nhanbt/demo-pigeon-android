// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<BaseStoreState>? _$stateComputed;

  @override
  BaseStoreState get state => (_$stateComputed ??=
          Computed<BaseStoreState>(() => super.state, name: '_HomeStore.state'))
      .value;

  late final _$_weatherFutureAtom =
      Atom(name: '_HomeStore._weatherFuture', context: context);

  @override
  ObservableFuture<Either<BaseFailure, WeatherResponse>>? get _weatherFuture {
    _$_weatherFutureAtom.reportRead();
    return super._weatherFuture;
  }

  @override
  set _weatherFuture(
      ObservableFuture<Either<BaseFailure, WeatherResponse>>? value) {
    _$_weatherFutureAtom.reportWrite(value, super._weatherFuture, () {
      super._weatherFuture = value;
    });
  }

  late final _$weatherAtom = Atom(name: '_HomeStore.weather', context: context);

  @override
  WeatherResponse? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(WeatherResponse? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getWeatherByCityNameAsyncAction =
      AsyncAction('_HomeStore.getWeatherByCityName', context: context);

  @override
  Future<dynamic> getWeatherByCityName(String cityName) {
    return _$getWeatherByCityNameAsyncAction
        .run(() => super.getWeatherByCityName(cityName));
  }

  @override
  String toString() {
    return '''
weather: ${weather},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
