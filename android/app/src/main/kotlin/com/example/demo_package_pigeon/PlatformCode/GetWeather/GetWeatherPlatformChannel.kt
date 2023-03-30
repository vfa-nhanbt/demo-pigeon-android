package com.example.demo_package_pigeon.PlatformCode.GetWeather

import FlutterError
import WeatherApi
import com.example.demo_package_pigeon.App
import com.example.demo_package_pigeon.R
import com.example.demo_package_pigeon.Utils.Utils
import com.example.demo_package_pigeon.repositories.IWeatherRepository
import com.google.gson.Gson
import io.flutter.embedding.engine.FlutterEngine
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

open class GetWeatherPlatformChannel {
    companion object {
        val instance: GetWeatherPlatformChannel by lazy { GetWeatherPlatformChannel() }
    }

    fun call(flutterEngine: FlutterEngine, repository: IWeatherRepository) {

        return WeatherApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            WeatherPlatformApi(repository),
        )
    }

    private class WeatherPlatformApi(repository: IWeatherRepository) : WeatherApi {
        private val repository: IWeatherRepository

        init {
            this.repository = repository
        }

        @OptIn(DelicateCoroutinesApi::class)
        override fun getWeatherByCityName(cityName: String, callback: (Result<String>) -> Unit) {

            GlobalScope.launch {
                try {
                    val gson = Gson()
                    val weather = repository.getWeatherByCityName(cityName)
                    val toJson: String? = gson.toJson(weather)

                    if (toJson.isNullOrEmpty()) {
                        callback(
                            Result.failure(
                                FlutterError(
                                    "NullException",
                                    "Type cannot be empty!",
                                    "Json parse failed"
                                ),
                            ),
                        )
                    }

                    callback(Result.success(toJson!!))
                } catch (e: Exception) {
                    callback(Result.failure(FlutterError("Exception", e.message, null)))
                }
            }
        }

    }
}
