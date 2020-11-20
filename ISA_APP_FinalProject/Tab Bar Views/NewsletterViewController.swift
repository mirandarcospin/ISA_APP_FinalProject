//
//  NewsletterViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit
import WebKit
//import SafariServices

class NewsletterViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var backButton: UIBarButtonItem?
    var forwardButton: UIBarButtonItem?
    
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
        
        
        self.navigationController?.setToolbarHidden(false, animated: true)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left")!.withTintColor(.black, renderingMode: .alwaysTemplate), style: .plain, target: self.webView, action: #selector(WKWebView.goBack))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "arrow.right")!.withTintColor(.black, renderingMode: .alwaysTemplate), style: .plain, target: self.webView, action: #selector(WKWebView.goForward))
        let reloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise")!.withTintColor(.black, renderingMode: .alwaysTemplate),style: .plain, target: self.webView, action: #selector(WKWebView.reload))
        
        self.toolbarItems = [backButton, forwardButton, UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), reloadButton]

        self.backButton?.isEnabled = self.webView.canGoBack
        self.forwardButton?.isEnabled = self.webView.canGoForward
    }
    
}
