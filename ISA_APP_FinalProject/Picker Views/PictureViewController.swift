//
//  PictureViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/20/20.
//

import UIKit
import WebKit

class PictureViewController: UIViewController, WKUIDelegate {

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

        title = "Pictures"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://isaofacu.wixsite.com/website/look-book")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
