package com.example.demo_package_pigeon.Utils

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Build
import androidx.annotation.RequiresApi

object Utils {

    /**
     * Check network connectivity status
     * @return true if network is available, otherwise return false.
     */
    @RequiresApi(Build.VERSION_CODES.M)
    @JvmStatic
    fun isNetworkAvailable(context: Context): Boolean {
        var isNetworkAvailable = false
        val connectivityManager =
            context.getSystemService(ConnectivityManager::class.java) as ConnectivityManager
        val capabilities =
            connectivityManager.getNetworkCapabilities(connectivityManager.activeNetwork)
        if (capabilities != null) {
            if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) {
                isNetworkAvailable = true
            } else if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) {
                isNetworkAvailable = true
            }
        }
        return isNetworkAvailable
    }
}
