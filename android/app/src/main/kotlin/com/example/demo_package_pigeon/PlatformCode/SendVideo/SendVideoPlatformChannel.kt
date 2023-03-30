package com.example.demo_package_pigeon.PlatformCode.SendVideo

import FlutterError
import Video
import VideoApi
import VideoInfo
import com.example.demo_package_pigeon.App
import com.example.demo_package_pigeon.R
import com.example.demo_package_pigeon.Utils.Utils
import io.flutter.embedding.engine.FlutterEngine

class SendVideoPlatformChannel {

    companion object {
        val instance: SendVideoPlatformChannel by lazy { SendVideoPlatformChannel() }
    }

    fun call(flutterEngine: FlutterEngine) {

        return VideoApi.setUp(flutterEngine.dartExecutor.binaryMessenger, SendVideoApi())
    }

    private class SendVideoApi : VideoApi {
        override fun sendVideoFromNative(): Video {
            try {
                val bytes = Utils.loadVideoToBytes(App.getAppContext(), R.raw.video)
                return Video(
                    VideoInfo(
                        "A Cloud of Blue Green Paint Underwater\nCredit:Mart Production",
                        28.2
                    ),
                    bytes,
                )
            } catch (e: Exception) {
                throw FlutterError("ConverterException", "Cannot convert video file to bytes", "$e")
            }
        }
    }
}
