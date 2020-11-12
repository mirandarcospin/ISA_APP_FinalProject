//
//  ListTableViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class ListTableViewController: UITableViewController {

    var listArray = ["Profile", "Notifications", "Chapel", "Events", "Pictures", "Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        // Configure the cell...

        // use the values in the array to make cast list cell pretty
        cell.textLabel?.text = listArray[indexPath.row]
        //cell.detailTextLabel?.text = castListArray?[indexPath.row].role

        return cell
    }

}
