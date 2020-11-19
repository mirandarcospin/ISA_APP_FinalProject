//
//  NewsletterViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit
import WebKit
import SafariServices

class NewsletterViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Newsletter"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://isaofacu.wixsite.com/website/upcoming-events")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        UIApplication.shared.canOpenURL(myURL!)
    }

}
