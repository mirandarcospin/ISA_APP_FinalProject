//
//  HomeViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    var detailItem : Information? {
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showList" {
            let controller = segue.destination as! ListTableViewController
            if let listArrayList = detailItem?.nameView {
                controller.listArray = listArrayList
            }
        }
    }
    
}
