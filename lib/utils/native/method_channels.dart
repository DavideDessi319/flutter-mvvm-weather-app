import 'package:flutter/services.dart';

class MethodChannels {
  static callNativeWebView() async {
    const MethodChannel channel =
        MethodChannel('alpian.weather/native-webview');
    await channel.invokeMethod('openWebView');
  }
}
