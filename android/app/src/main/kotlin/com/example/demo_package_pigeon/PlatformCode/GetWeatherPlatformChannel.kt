package com.example.demo_package_pigeon.PlatformCode

import com.example.demo_package_pigeon.repositories.IWeatherRepository
import com.google.gson.Gson
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.WeatherPigeon
import io.flutter.plugins.WeatherPigeon.FlutterError
import io.flutter.plugins.WeatherPigeon.WeatherApi
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

open class GetWeatherPlatformChannel {
    companion object {
        val instance: GetWeatherPlatformChannel by lazy { GetWeatherPlatformChannel() }
    }

    fun call(flutterEngine: FlutterEngine, repository: IWeatherRepository) {
        return WeatherApi.setup(
            flutterEngine.dartExecutor.binaryMessenger,
            WeatherPlatformApi(repository)
        )
    }

    class WeatherPlatformApi(repository: IWeatherRepository) : WeatherApi {
        private val repository: IWeatherRepository

        init {
            this.repository = repository
        }

        @OptIn(DelicateCoroutinesApi::class)
        override fun getWeatherByCityName(cityName: String, result: WeatherPigeon.Result<String>?) {
            GlobalScope.launch {
                try {
                    val gson = Gson()
                    val weather = repository.getWeatherByCityName(cityName)
                    val toJson: String? = gson.toJson(weather)

                    if (toJson.isNullOrEmpty()) {
                        result?.error(
                            FlutterError(
                                "NullException",
                                "Type cannot be empty!",
                                "Json parse failed"
                            )
                        )
                    }

                    result?.success(toJson)
                } catch (e: Exception) {
                    result?.error(FlutterError("Exception", e.message, null))
                }
            }
        }
    }
}
