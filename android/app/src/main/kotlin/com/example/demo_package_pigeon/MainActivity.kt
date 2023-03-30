package com.example.demo_package_pigeon

import com.example.demo_package_pigeon.PlatformCode.GetWeather.GetWeatherPlatformChannel
import com.example.demo_package_pigeon.PlatformCode.SendVideo.SendVideoPlatformChannel
import com.example.demo_package_pigeon.locators.ServiceLocator
import com.example.demo_package_pigeon.repositories.IWeatherRepository
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    private val repository: IWeatherRepository
        get() = ServiceLocator.provideWeatherRepository(this)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        GetWeatherPlatformChannel.instance.call(flutterEngine, repository)
        SendVideoPlatformChannel.instance.call(flutterEngine)
    }
}
