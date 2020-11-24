//
//  ContactsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/23/20.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    
    var detailItem: Positions? {
            didSet {
                configureView()
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white

        configureView()
    }
    
    func configureView() {
        if let entry = detailItem {            
            if let label = nameLabel{
                label.text = entry.officername
            }
            if let label = roleLabel{
                label.text = entry.role
            }
            if let label = emailLabel {
                label.text = entry.personEmail
            }
            if let imageView = mediaImage {
                if entry.officerPic != "" {
                    let url = URL(string: entry.officerPic ?? "")
                    let data = try? Data(contentsOf: url!)
                    imageView.image = UIImage(data: data!)
                }
            }
            if let textView = aboutTextView {
               textView.text = entry.aboutOfficer ?? "Hello!!!"
           }

        }
    }
    
   
}
