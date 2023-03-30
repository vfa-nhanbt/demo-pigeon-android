flutter pub run pigeon \
  --input lib/pigeons/api/weather_api.dart \
  --dart_out lib/pigeons/generated/weather_pigeon.dart \
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m \
  --experimental_swift_out ios/Runner/WeatherPigeon.swift \
  --java_out ./android/app/src/main/java/io/flutter/plugins/WeatherPigeon.java \
  --kotlin_out ./android/app/src/main/kotlin/com/example/demo_package_pigeon/PlatformCode/WeatherPigeon.kt \
  --java_package "io.flutter.plugins"

  flutter pub run pigeon \
  --input lib/pigeons/api/video_api.dart \
  --dart_out lib/pigeons/generated/video_pigeon.dart \
  --kotlin_out ./android/app/src/main/kotlin/com/example/demo_package_pigeon/PlatformCode/SendVideo/VideoPigeon.kt \

  flutter pub run pigeon \
  --input lib/pigeons/api/weather_api.dart \
  --dart_out lib/pigeons/generated/weather_pigeon.dart \
  --kotlin_out ./android/app/src/main/kotlin/com/example/demo_package_pigeon/PlatformCode/GetWeather/WeatherPigeon.kt \