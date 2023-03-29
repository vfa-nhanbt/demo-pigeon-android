flutter pub run pigeon \
  --input lib/pigeons/api/weather_api.dart \
  --dart_out lib/pigeons/generated/weather_pigeon.dart \
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m \
  --experimental_swift_out ios/Runner/WeatherPigeon.swift \
  --java_out ./android/app/src/main/java/io/flutter/plugins/WeatherPigeon.java \
  --java_package "io.flutter.plugins"