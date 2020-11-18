//
//  ListTableViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class ListTableViewController: UITableViewController {

    var listArray: [InfoSettings]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCellProfile", for: indexPath)

        // Configure the cell...

        // use the values in the array to make cast list cell pretty
        //cell.textLabel?.text = listArray?[indexPath.row].profile
        cell.textLabel?.text = listArray?[indexPath.row].profile
//        cell.textLabel?.text = listArray?[indexPath.row].notifications
//        cell.textLabel?.text = listArray?[indexPath.row].chapel
//        cell.textLabel?.text = listArray?[indexPath.row].events
//        cell.textLabel?.text = listArray?[indexPath.row].pictures
//        cell.textLabel?.text = listArray?[indexPath.row].settings

        return cell
    }

}
