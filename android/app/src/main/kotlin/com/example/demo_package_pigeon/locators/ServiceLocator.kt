package com.example.demo_package_pigeon.locators

import android.content.Context
import com.example.demo_package_pigeon.BuildConfig
import com.example.demo_package_pigeon.Utils.Constants
import com.example.demo_package_pigeon.network.APIService
import com.example.demo_package_pigeon.network.HeaderInterceptor
import com.example.demo_package_pigeon.repositories.WeatherRepositoryImp
import com.nhanbt.socialandroidapp.network.NetworkConnectionInterceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory
import java.util.concurrent.TimeUnit

object ServiceLocator {

    @Volatile
    var weatherRepository: WeatherRepositoryImp? = null

    private var apiService: APIService? = null

    private fun createAPIService(context: Context): APIService {
        // Logger
        val loggingInterceptor = HttpLoggingInterceptor()
        loggingInterceptor.level = HttpLoggingInterceptor.Level.BODY

        val okHttpClient = OkHttpClient.Builder()
            // Add interceptors
            .addInterceptor(NetworkConnectionInterceptor(context))
            .addInterceptor(HeaderInterceptor())
            .addInterceptor(loggingInterceptor)
            // Config connection
            .connectTimeout(Constants.TIME_OUT, TimeUnit.SECONDS)
            .readTimeout(Constants.TIME_OUT, TimeUnit.SECONDS)
            .writeTimeout(Constants.TIME_OUT, TimeUnit.SECONDS)
            .callTimeout(Constants.TIME_OUT, TimeUnit.SECONDS)
            .build()

        // Create Retrofit
        val retrofit = Retrofit.Builder()
            .baseUrl(BuildConfig.SERVER_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .client(okHttpClient)
            .build()

        val result = retrofit.create(APIService::class.java)
        apiService = result
        return result
    }

    private fun createWeatherRepository(context: Context): WeatherRepositoryImp {
        val apiService = apiService ?: createAPIService(context)
        val newRepo = WeatherRepositoryImp(apiService)
        weatherRepository = newRepo
        return newRepo
    }

    fun provideWeatherRepository(context: Context): WeatherRepositoryImp {
        return weatherRepository ?: synchronized(this) {
            weatherRepository ?: createWeatherRepository(context)
        }
    }
}
