//
//  SettingsViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/20/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard

    var firstTimeAppLaunch: Bool {
        get {
            return userDefaults.bool(forKey: "firstTimeAppLaunch")
        }
        set {}
    }

    @IBOutlet weak var switchContactMe : UISwitch!
    
    
    @IBAction func switchTapped(_ sender:UISwitch!) {
        userDefaults.set(sender.isOn, forKey: "switchValue")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !firstTimeAppLaunch {
            // This will only be trigger first time the application is launched.
            userDefaults.set(true, forKey: "firstTimeAppLaunch")
            userDefaults.set(true, forKey: "switchValue")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switchContactMe.isOn = userDefaults.bool(forKey: "switchValue")
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
