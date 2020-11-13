//
//  ContactsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet var nameAD: UILabel!
    @IBOutlet var nameISAA: UILabel!
    @IBOutlet var nameISSI: UILabel!
    @IBOutlet var nameP: UILabel!
    @IBOutlet var nameVP: UILabel!
    @IBOutlet var nameS: UILabel!
    @IBOutlet var nameT: UILabel!
    @IBOutlet var nameMD: UILabel!
    @IBOutlet var nameC: UILabel!
    @IBOutlet var nameCD: UILabel!
    @IBOutlet var nameH: UILabel!
    @IBOutlet var nameINSTA: UILabel!
    @IBOutlet var nameFACEBOOK: UILabel!
    
    var detailItem: Information? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem {
            if let label = nameAD {
                label.text = entry.contactsView[0].office[0].officeName
            }
//            if let label = nameISAA {
//                label.text = entry.office[1].officeName
//            }
//            if let label = nameISSI {
//                label.text = entry.office[2].officeName
//            }
//            if let label = nameP {
//                label.text = entry.isaOfficers[0].officername
//            }
//            if let label = nameVP {
//                label.text = entry.isaOfficers[1].officername
//            }
//            if let label = nameS {
//                label.text = entry.isaOfficers[2].officername
//            }
//            if let label = nameT {
//                label.text = entry.isaOfficers[3].officername
//            }
//            if let label = nameMD {
//                label.text = entry.isaOfficers[4].officername
//            }
//            if let label = nameC {
//                label.text = entry.isaOfficers[5].officername
//            }
//            if let label = nameCD {
//                label.text = entry.isaOfficers[6].officername
//            }
//            if let label = nameH {
//                label.text = entry.isaOfficers[7].officername
//            }
//            if let label = nameINSTA {
//                label.text = entry.socialMedia[0].instagram
//            }
//            if let label = nameFACEBOOK {
//                label.text = entry.socialMedia[1].facebook
//            }
        }
    }
    
    var nameArray1 = ["NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME"]
    var emailArray1 = ["ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu"]

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showEmails" {
            let controller = segue.destination as! EmailTableViewController
                controller.nameArray = nameArray1
                controller.emailArray = emailArray1
        }
    }
}
