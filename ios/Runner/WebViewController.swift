//
//  WebView.swift
//  Runner
//
//  Created by Davide Dessí on 15/05/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController , WKUIDelegate {
    
    var webView: WKWebView!
    var openWeatherStringURL: String = "https://openweathermap.org/weathermap?basemap=map&cities=false&layer=temperature&lat=51&lon=0&zoom=10"
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let openWeatherURL = URL(string:openWeatherStringURL)
        let wvRequest = URLRequest(url: openWeatherURL!)
        webView.configuration.preferences.javaScriptEnabled = true
        webView.load(wvRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.backgroundColor = UIColor.white
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        } else {
            return .lightContent
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
