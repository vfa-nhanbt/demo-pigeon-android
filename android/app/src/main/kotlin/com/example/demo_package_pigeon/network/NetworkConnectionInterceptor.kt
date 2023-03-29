package com.nhanbt.socialandroidapp.network

import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import com.example.demo_package_pigeon.Utils.Utils
import okhttp3.Interceptor
import okhttp3.Response
import java.io.IOException

class NetworkConnectionInterceptor(private val context: Context) : Interceptor {

    @RequiresApi(Build.VERSION_CODES.M)
    override fun intercept(chain: Interceptor.Chain): Response {

        // Get network connectivity status
        val isNetworkAvailable = Utils.isNetworkAvailable(context)
        // If network is not available
        if (!isNetworkAvailable) {
            // Cancel request
            chain.call().cancel()
            // Throw a No Internet Exception
            throw NoInternetException(context)
        }

        return chain.proceed(chain.request())
    }
}

class NoInternetException(private val context: Context) : IOException() {

    override val message: String
        get() = "No internet connection.\\nPlease check your network and try again."
}
