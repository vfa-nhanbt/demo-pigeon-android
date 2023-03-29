package com.example.demo_package_pigeon.network

import com.example.demo_package_pigeon.BuildConfig
import com.example.demo_package_pigeon.Utils.Constants
import okhttp3.Interceptor
import okhttp3.Response

class HeaderInterceptor : Interceptor {

    override fun intercept(chain: Interceptor.Chain): Response {

        // Original request
        val request = chain.request()
        val newBuilder = request.newBuilder()

        // API Key if have
        newBuilder.header(Constants.X_API_KEY_HEADER, BuildConfig.API_KEY)

        // Pass request down the chain, and get the response synchronously
        return chain.proceed(newBuilder.build())
    }
}
