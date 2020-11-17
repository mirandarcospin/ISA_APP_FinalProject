//
//  EmailTableViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class EmailTableViewController: UITableViewController {
    
    
    var mediaModel: InfoData? {
        didSet {
            tableView.reloadData()
        }
    }

    var dataController = DataController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Emails"
        
        let nav = self.navigationController?.navigationBar

        nav?.barStyle = UIBarStyle.black
        
        dataController.getJSONData(completion: { dataModel in
            self.mediaModel = dataModel
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return mediaModel?.information[2].nameView[2].views.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel?.information[section].nameView[section].views.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.information[section].nameView[section].views[section].viewInfoContacts[section].positionName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showEmails", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = mediaModel?.information[indexPath.section].nameView[indexPath.section].views[indexPath.section].viewInfoContacts[indexPath.section].positions[indexPath.section].officername
        cell.detailTextLabel?.text = mediaModel?.information[indexPath.section].nameView[indexPath.section].views[indexPath.section].viewInfoContacts[indexPath.section].positions[indexPath.section].personEmail
        
        return cell
    }
    
}
