//
//  OfficersViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/24/20.
//

import UIKit
import WebKit

class OfficersViewController: UIViewController, WKUIDelegate {

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

        title = "ISA Officers"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://isaofacu.wixsite.com/website/officers")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
