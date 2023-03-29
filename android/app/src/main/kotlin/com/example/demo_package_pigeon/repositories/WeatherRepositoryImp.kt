package com.example.demo_package_pigeon.repositories

import com.example.demo_package_pigeon.network.APIService
import com.example.demo_package_pigeon.repositories.response.ErrorResponse
import com.example.demo_package_pigeon.repositories.response.Weather
import com.google.gson.Gson

class WeatherRepositoryImp(
    private val api: APIService
) : IWeatherRepository {

    override suspend fun getWeatherByCityName(cityName: String): Weather {
        val response = try {
            api.getWeatherByCityName(cityName)
        } catch (e: Exception) {
            throw Exception(e.message ?: "Unexpected Error!")
        }

        if (response.isSuccessful && response.body() != null) {
            println(response)
            return response.body()!!
        }

        val gson = Gson()
        val errorBody: ErrorResponse =
            gson.fromJson(response.errorBody()!!.string(), ErrorResponse::class.java)
        throw Exception(errorBody.message)
    }
}
