import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var navigationController: UINavigationController!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      self.navigationController = UINavigationController(rootViewController: controller)
      self.navigationController?.isNavigationBarHidden = true
      self.window = UIWindow(frame: UIScreen.main.bounds)
      self.window.rootViewController = self.navigationController
      self.window.makeKeyAndVisible()
      let nativeChannel = FlutterMethodChannel(name: "alpian.weather/native-webview",
                                                    binaryMessenger: controller.binaryMessenger)
      nativeChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          guard call.method == "openWebView" else {
              result(FlutterMethodNotImplemented)
              return
            }
          
          let sb = UIStoryboard(name: "Main", bundle: nil)
          let uiController = sb.instantiateViewController(withIdentifier: "WebViewController")
          self.navigationController?.pushViewController(uiController, animated: true)
      })

      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
