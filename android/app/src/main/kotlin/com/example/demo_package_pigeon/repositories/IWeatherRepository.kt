package com.example.demo_package_pigeon.repositories

import com.example.demo_package_pigeon.repositories.response.Weather

interface IWeatherRepository {
    suspend fun getWeatherByCityName(cityName: String): Weather
}
