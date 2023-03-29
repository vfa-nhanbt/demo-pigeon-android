package com.example.demo_package_pigeon.network

import com.example.demo_package_pigeon.repositories.response.Weather
import retrofit2.Response
import retrofit2.http.*

interface APIService {
    @GET("weather?")
    suspend fun getWeatherByCityName(@Query("q") cityName: String): Response<Weather>
}
