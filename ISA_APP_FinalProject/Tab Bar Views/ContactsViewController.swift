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
   
    
    var detailItem: Positions? {
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
                label.text = entry.officername
            }
            if let label = roleLabel{
                label.text = entry.role
            }
            if let label = emailLabel {
                label.text = entry.personEmail
            }
            if let textView = aboutLabel {
                textView.text = entry.aboutOfficer ?? ""
            }
            if let imageView = mediaImage {
                let url = URL(string: entry.officerPic ?? "")
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
        }
    }
}
