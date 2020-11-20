//
//  PickerViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/19/20.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    //var pickerData: [InfoSettings]?
    var pickerData: [String] = [String]()
    var PlacementAnswer = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["None", "Chapel", "Events", "Pictures", "Notifications", "Settings"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        
        let myTitle = NSAttributedString(string: titleData, attributes:
            [
                NSAttributedString.Key.font : UIFont(name: "Avenir Next Condensed Regular", size: 20.0)!,
                NSAttributedString.Key.foregroundColor : UIColor.white,
            ])
        return myTitle
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerData[row]
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 1 { //Chapel
            let p1 = storyboard?.instantiateViewController(identifier: "ChapelView") as! ChapelViewController
            present(p1, animated: true, completion: nil)
            
        }
        else if row == 2 { //Events
            let p2 = storyboard?.instantiateViewController(identifier: "UPEventsView") as! UpEventsViewController
            present(p2, animated: true, completion: nil)
            
        }
        else if row == 3 { //Pictures
            let p3 = storyboard?.instantiateViewController(identifier: "PictureView") as! PictureViewController
            present(p3, animated: true, completion: nil)
            
        }
        else if row == 4 { //Notifications
            let p4 = storyboard?.instantiateViewController(identifier: "NotificationsView") as! NotificationsViewController
            present(p4, animated: true, completion: nil)
            
        }
        else if row == 5 { //Settings
            let p5 = storyboard?.instantiateViewController(identifier: "SettingsView") as! SettingsViewController
            present(p5, animated: true, completion: nil)
        }
        
    }

}

