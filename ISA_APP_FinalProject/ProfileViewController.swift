//
//  ProfileViewController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/11/20.
//

import UIKit
import Foundation

class ProfileViewController: UIViewController {

    var profileData: [Profile] = []
    var fm = FileManager.default
    var fresult: Bool = false
    var subUrl: URL?
    var mainUrl: URL? = Bundle.main.url(forResource: "profile", withExtension: "json")
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var collegeLabel: UITextField!
    @IBOutlet weak var roleLabel: UITextField!
    @IBOutlet weak var gradYearLabel: UITextField!
    @IBOutlet weak var birthdayLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var instaLabel: UITextField!
   // @IBOutlet var editButton: UIButton!

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"

        // 1
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        tapToChangeProfileButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)

        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = self
        getData()
        
        setupTexts()
        setupEditButton()
    }
    
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("profile.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            
            if profileData.isEmpty{
                decodeData(pathName: mainPath)
            }
            
        }else{
            decodeData(pathName: mainPath)
        }
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            profileData = try decoder.decode([Profile].self, from: jsonData)
        } catch {}
    }
    
    @objc func openImagePicker(_ sender:Any){
        //open image picker
    }
    
    func setupTexts() {
        nameLabel.text = profileData[0].name
        emailLabel.text = profileData[0].email
        collegeLabel.text = profileData[0].college
        roleLabel.text = profileData[0].role
        gradYearLabel.text = profileData[0].gradYear
        birthdayLabel.text = profileData[0].birthday
        countryLabel.text = profileData[0].country
        instaLabel.text = profileData[0].insta
    }
    
    func validate() -> Bool{
        if(nameLabel.text!.isEmpty || emailLabel.text!.isEmpty || collegeLabel.text!.isEmpty || roleLabel.text!.isEmpty || gradYearLabel.text!.isEmpty || birthdayLabel.text!.isEmpty || countryLabel.text!.isEmpty || instaLabel.text!.isEmpty){
            return false
        }
        return true
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(profileData)
            try JsonData.write(to: location)
        }catch{}
    }
    
    func setupEditButton(){
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tappedEditButton))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func tappedEditButton() {
        
        setupSaveButton()
        
        nameLabel.isUserInteractionEnabled = true
        nameLabel.borderStyle = .roundedRect
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .black
        
        emailLabel.isUserInteractionEnabled = true
        emailLabel.borderStyle = .roundedRect
        emailLabel.backgroundColor = .white
        emailLabel.textColor = .black
        
        collegeLabel.isUserInteractionEnabled = true
        collegeLabel.borderStyle = .roundedRect
        collegeLabel.backgroundColor = .white
        collegeLabel.textColor = .black
    }
    
    func setupSaveButton(){
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(tappedSaveButton))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func tappedSaveButton() {
        
        if validate() == true{
            
            profileData[0].name = nameLabel.text!
            profileData[0].email = emailLabel.text!
            profileData[0].college = collegeLabel.text!
            
            setupEditButton()
            
            nameLabel.isUserInteractionEnabled = false
            nameLabel.borderStyle = .none

            emailLabel.isUserInteractionEnabled = false
            emailLabel.borderStyle = .none
            
            collegeLabel.isUserInteractionEnabled = false
            collegeLabel.borderStyle = .none
            
            fresult = true
            
            if fresult == true{
                writeToFile(location: subUrl!)
                fresult = false
            }
        }else {
            let alert = UIAlertController(title: "Reminder:", message: "All fields are required!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
