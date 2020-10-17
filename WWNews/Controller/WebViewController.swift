//
//  WebViewController.swift
//  WWNews
//
//  Created by Md Ashfaqur Rahman on 20/3/20.
//  Copyright © 2020 Md Ashfaqur Rahma. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var containWebURL: String = ""
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if containWebURL != "" {
            let myURL = URL(string:containWebURL)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
        
    }
}
