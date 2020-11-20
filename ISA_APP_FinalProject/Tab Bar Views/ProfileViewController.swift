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
    let darkGreyColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1.0)
    
    
    
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


    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"

        //FOR IMAGE IN PROFILE
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
                
        // GET DATA FOR TEXT LABELS, SAVE INFORMATION IN JSON, AND EDIT BUTTON
        getData()
        setupTexts()
        setupEditButton()
    }
    
    
    
//**************************************************************
//                 FOR CHANGING PROFILE PICTURE                *
//**************************************************************
    
    @objc func openImagePicker(_ sender:Any){
        //open image picker
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
    
    
    
//**************************************************************
//     FOR TEXT LABELS. INFORMATION OF THE USER IS SAVED       *
//**************************************************************
    
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("profile.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            profileData = try decoder.decode([Profile].self, from: jsonData)
        } catch {}
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
        if(nameLabel.text!.isEmpty || emailLabel.text!.isEmpty || collegeLabel.text!.isEmpty || roleLabel.text!.isEmpty || gradYearLabel.text!.isEmpty || birthdayLabel.text!.isEmpty || countryLabel.text!.isEmpty){
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
        editButton.setTitleTextAttributes(
        [
            NSAttributedString.Key.font : UIFont(name: "Avenir Next Condensed Regular", size: 20.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal)
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
        
        roleLabel.isUserInteractionEnabled = true
        roleLabel.borderStyle = .roundedRect
        roleLabel.backgroundColor = .white
        roleLabel.textColor = .black
        
        gradYearLabel.isUserInteractionEnabled = true
        gradYearLabel.borderStyle = .roundedRect
        gradYearLabel.backgroundColor = .white
        gradYearLabel.textColor = .black
        
        birthdayLabel.isUserInteractionEnabled = true
        birthdayLabel.borderStyle = .roundedRect
        birthdayLabel.backgroundColor = .white
        birthdayLabel.textColor = .black
        
        countryLabel.isUserInteractionEnabled = true
        countryLabel.borderStyle = .roundedRect
        countryLabel.backgroundColor = .white
        countryLabel.textColor = .black
        
        instaLabel.isUserInteractionEnabled = true
        instaLabel.borderStyle = .roundedRect
        instaLabel.backgroundColor = .white
        instaLabel.textColor = .black
    }
    
    func setupSaveButton(){
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(tappedSaveButton))
        saveButton.setTitleTextAttributes(
        [
            NSAttributedString.Key.font : UIFont(name: "Avenir Next Condensed Regular", size: 20.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal)
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func tappedSaveButton() {
        
        if validate() == true {
            
            profileData[0].name = nameLabel.text!
            profileData[0].email = emailLabel.text!
            profileData[0].college = collegeLabel.text!
            profileData[0].role = roleLabel.text!
            profileData[0].gradYear = gradYearLabel.text!
            profileData[0].birthday = birthdayLabel.text!
            profileData[0].country = countryLabel.text!
            profileData[0].insta = instaLabel.text!
            
            setupEditButton()
            
            nameLabel.isUserInteractionEnabled = false
            nameLabel.borderStyle = .roundedRect
            nameLabel.backgroundColor = darkGreyColor
            nameLabel.textColor = .white

            emailLabel.isUserInteractionEnabled = false
            emailLabel.borderStyle = .roundedRect
            emailLabel.backgroundColor = darkGreyColor
            emailLabel.textColor = .white
            
            collegeLabel.isUserInteractionEnabled = false
            collegeLabel.borderStyle = .roundedRect
            collegeLabel.backgroundColor = darkGreyColor
            collegeLabel.textColor = .white
            
            roleLabel.isUserInteractionEnabled = false
            roleLabel.borderStyle = .roundedRect
            roleLabel.backgroundColor = darkGreyColor
            roleLabel.textColor = .white
            
            gradYearLabel.isUserInteractionEnabled = false
            gradYearLabel.borderStyle = .roundedRect
            gradYearLabel.backgroundColor = darkGreyColor
            gradYearLabel.textColor = .white
            
            birthdayLabel.isUserInteractionEnabled = false
            birthdayLabel.borderStyle = .roundedRect
            birthdayLabel.backgroundColor = darkGreyColor
            birthdayLabel.textColor = .white
            
            countryLabel.isUserInteractionEnabled = false
            countryLabel.borderStyle = .roundedRect
            countryLabel.backgroundColor = darkGreyColor
            countryLabel.textColor = .white
            
            instaLabel.isUserInteractionEnabled = false
            instaLabel.borderStyle = .roundedRect
            instaLabel.backgroundColor = darkGreyColor
            instaLabel.textColor = .white
            
            fresult = true
            
            if fresult == true{
                writeToFile(location: subUrl!)
                fresult = false
            }

        } else {
            let alert = UIAlertController(title: "Reminder:", message: "Fields are required.\nInsatgram is optional", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
       }
    }

}
