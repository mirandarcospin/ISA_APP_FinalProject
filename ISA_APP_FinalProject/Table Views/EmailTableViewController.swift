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
        
        dataController.getJSONData(completion: { dataModel in
            self.mediaModel = dataModel
        })
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mediaModel?.information.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        cell.textLabel?.text = mediaModel?.information[indexPath.row].positions[indexPath.row].officername
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            if segue.identifier == "showData" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedObject = mediaModel!.information[indexPath.section].positions[indexPath.row]
                    let controller = segue.destination as! ContactsViewController
                    controller.detailItem = selectedObject
            }
        }
    }
    
}


