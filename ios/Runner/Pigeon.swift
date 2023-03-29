// Autogenerated from Pigeon (v9.1.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol WeatherApi {
  func getWeatherByCityName(cityName: String) throws -> String
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class WeatherApiSetup {
  /// The codec used by WeatherApi.
  /// Sets up an instance of `WeatherApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: WeatherApi?) {
    let getWeatherByCityNameChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.WeatherApi.getWeatherByCityName", binaryMessenger: binaryMessenger)
    if let api = api {
      getWeatherByCityNameChannel.setMessageHandler { message, reply in
        let args = message as! [Any]
        let cityNameArg = args[0] as! String
        do {
          let result = try api.getWeatherByCityName(cityName: cityNameArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getWeatherByCityNameChannel.setMessageHandler(nil)
    }
  }
}
