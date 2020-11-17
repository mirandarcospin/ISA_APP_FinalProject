//
//  ContactsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var aboutLabel: UITextView!
   
    
    var detailItem: Information? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem {
            if let label = nameLabel {
                label.text = entry.nameView[1].views[2].viewInfoContacts[0].positions[0].officername
            }
        }
    }

    
    // MARK: - Navigation


}
