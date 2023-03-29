package com.example.demo_package_pigeon.repositories.response

data class Weather(
    val id: String,
    val main: Main,
    val name: String,
    val timezone: Int
)
