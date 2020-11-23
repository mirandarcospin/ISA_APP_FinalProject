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
        return mediaModel?.information[0].viewsContact?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel?.information[section].viewsContact?[section].positionName.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.information[section].viewsContact?[section].positionName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = mediaModel?.information[indexPath.row].viewsContact?[indexPath.section].positions[indexPath.section].officername
        cell.detailTextLabel?.text = mediaModel?.information[indexPath.row].viewsContact?[indexPath.section].positions[indexPath.section].personEmail
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showEmails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = mediaModel!.information[indexPath.section].viewsContact?[indexPath.row].positions[indexPath.row]
                let controller = segue.destination as! ContactsViewController
                controller.detailItem = selectedObject
            }
        }
    }
    
}
