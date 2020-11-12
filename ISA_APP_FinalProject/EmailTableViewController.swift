//
//  EmailTableViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class EmailTableViewController: UITableViewController {
    
    var nameArray = ["NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME", "NAME"]
    var emailArray = ["ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu", "ex1@acu.edu"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return nameArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)

        // Configure the cell...

        // use the values in the array to make cast list cell pretty
        cell.textLabel?.text = nameArray[indexPath.row]
        cell.detailTextLabel?.text = emailArray[indexPath.row]

        return cell
    }

}
