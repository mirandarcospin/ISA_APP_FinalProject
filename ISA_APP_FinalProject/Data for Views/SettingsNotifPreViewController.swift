//
//  SettingsNotifPreViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/20/20.
//

import UIKit

class SettingsNotifPreViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var switchChapel : UISwitch!
    @IBOutlet weak var switchUpEvents : UISwitch!
    @IBOutlet weak var switchNLUpdate : UISwitch!
    
    @IBAction func switchTapped(_ sender:UISwitch!) {
        userDefaults.set(sender.isOn, forKey: "switchValue")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        if (userDefaults.bool(forKey: "switchValue")) {
            switchChapel.isOn = true
            switchUpEvents.isOn = true
            switchNLUpdate.isOn = true
        } else {
            switchChapel.isOn = false
            switchUpEvents.isOn = false
            switchNLUpdate.isOn = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switchChapel.isOn = userDefaults.bool(forKey: "switchValue")
        switchUpEvents.isOn = userDefaults.bool(forKey: "switchValue")
        switchNLUpdate.isOn = userDefaults.bool(forKey: "switchValue")
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
