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
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        cell.textLabel?.text = listArray?[indexPath.row].setName

        return cell
    }

}
