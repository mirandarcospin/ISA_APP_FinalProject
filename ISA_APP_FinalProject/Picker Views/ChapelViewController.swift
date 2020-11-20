//
//  ChapelViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/19/20.
//

import UIKit
import WebKit

class ChapelViewController: UIViewController, WKUIDelegate {
    
    
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chapel"
        
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://isaofacu.wixsite.com/website/informacion-del-evento/isa-chapel-1")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

    }

}
  

