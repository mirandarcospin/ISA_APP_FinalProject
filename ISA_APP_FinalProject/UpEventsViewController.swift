//
//  ViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/19/20.
//

import UIKit
import WebKit

class UpEventsViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var homeBack: UINavigationItem!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Upcoming Events"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://isaofacu.wixsite.com/website/events-1")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
