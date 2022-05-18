package com.example.weather_app_alpian

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.webkit.WebView

class WebViewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view)


        val actionbar = supportActionBar
        actionbar!!.title = "Back"
        actionbar.setDisplayHomeAsUpEnabled(true)

        val webViewElement: WebView = findViewById<View>(R.id.webview_element) as WebView
        webViewSetup(webViewElement)
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    @SuppressLint("SetJavaScriptEnabled")
    private fun webViewSetup(webView: WebView){
        val openWeatherURL: String = "https://openweathermap.org/weathermap?basemap=map&cities=false&layer=temperature&lat=51&lon=0&zoom=10"
        webView.apply {
            loadUrl(openWeatherURL)
            settings.javaScriptEnabled = true
        }
    }
}