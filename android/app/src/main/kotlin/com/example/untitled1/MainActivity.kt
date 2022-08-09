package com.example.untitled1

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain

class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "com.example.untitled1.channel"
        const val KEY_NATIVE = "showNativeView"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        FlutterMain.startInitialization(this) //Added line
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == KEY_NATIVE) {
                val intent = Intent(this, NativeAndroidActivity::class.java)
                startActivity(intent)
                result.success(true)
            } else {
                result.notImplemented()
            }
        }
    }
}
