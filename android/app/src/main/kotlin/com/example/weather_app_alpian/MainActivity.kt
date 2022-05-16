package com.example.weather_app_alpian


import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val NATIVE_METHOD_CHANNEL = "alpian.weather/native-webview"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NATIVE_METHOD_CHANNEL)
        channel.setMethodCallHandler{call, result ->
            if(call.method.equals("openWebView")){
                val webViewIntent: Intent = Intent(this, WebViewActivity::class.java)
                startActivity(webViewIntent)
            }
        }
    }
}
