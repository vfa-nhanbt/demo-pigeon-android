// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/source/remote/weather_remote_data_source.dart' as _i3;
import '../data/source/remote/weather_remote_data_source_imp.dart' as _i4;
import '../data/source/repositories/weather_repository.dart' as _i5;
import '../data/source/repositories/weather_repository_imp.dart' as _i6;
import '../ui/home/home_store.dart' as _i8;
import '../ui/home/home_use_case.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.WeatherRemoteDataSource>(
      () => _i4.WeatherRemoteDataSourceImp());
  gh.lazySingleton<_i5.WeatherRepository>(
      () => _i6.WeatherRepositoryImp(gh<_i3.WeatherRemoteDataSource>()));
  gh.lazySingleton<_i7.GetWeatherUseCase>(
      () => _i7.GetWeatherUseCase(gh<_i5.WeatherRepository>()));
  gh.factory<_i8.HomeStore>(() => _i8.HomeStore(gh<_i7.GetWeatherUseCase>()));
  return getIt;
}
