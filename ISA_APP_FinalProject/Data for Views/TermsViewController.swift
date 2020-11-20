//
//  TermsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/20/20.
//

import UIKit
import WebKit

class TermsViewController: UIViewController, WKUIDelegate {

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

        title = "Terms"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://www.involvio.com/legal/terms")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }


}
