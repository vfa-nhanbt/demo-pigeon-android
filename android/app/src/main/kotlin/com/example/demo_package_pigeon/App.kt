package com.example.demo_package_pigeon

import android.app.Application
import android.content.Context

class App : Application() {
    companion object {
        private lateinit var app: App

        fun getAppContext(): Context {
            return app.applicationContext
        }
    }

    override fun onCreate() {
        super.onCreate()
        app = this
    }
}
