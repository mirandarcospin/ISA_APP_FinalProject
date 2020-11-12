//
//  ContactsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit

class ContactsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
