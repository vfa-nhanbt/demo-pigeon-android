package com.example.demo_package_pigeon.repositories.response

import com.google.gson.annotations.SerializedName

data class ErrorResponse(
    @SerializedName("cod")
    val cod: Int,

    @SerializedName("message")
    val message: String
)
