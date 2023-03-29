// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:demo_package_pigeon/data/source/base_result.dart';

import 'weather_main.dart';

class WeatherResponse extends BaseObject {
  final String id;
  final String name;
  final int timezone;
  final WeatherMain main;

  WeatherResponse({
    this.id = "",
    this.name = "",
    this.timezone = 0,
    this.main = const WeatherMain(temp: 0),
  });

  WeatherResponse copyWith({
    String? id,
    String? name,
    int? timezone,
    WeatherMain? main,
  }) {
    return WeatherResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
      main: main ?? this.main,
    );
  }

  @override
  WeatherResponse fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      timezone: (map['timezone'] ?? 0) as int,
      main: WeatherMain.fromMap(map['main'] as Map<String, dynamic>),
    );
  }

  @override
  WeatherResponse fromJson(String source) {
    return fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'timezone': timezone,
      'main': main.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, timezone, main];

  DateTime get dateFromTimezone =>
      DateTime.now().add(Duration(seconds: timezone));

  double get celsiusTemp => (main.temp - 273.15);
}
