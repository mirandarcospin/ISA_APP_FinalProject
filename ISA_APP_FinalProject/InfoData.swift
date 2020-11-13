//
//  InfoData.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class InfoData: Codable {
    var information: [Information] = []
}

class Information: Codable {
    let yearStart: Int
    let yearEnd: Int
    let settingsView: [SettingsView]
    let contactsView: [ContactsView]
}

class SettingsView: Codable {
    let profile: String
    let notifications: String
    let chapel: String
    let events: String
    let pictures: String
    let settings: String
}

class ContactsView: Codable {
    let office: [Office]
    let isaOfficers: [ISAOfficers]
    let socialMedia: [SocialMedia]
}

class Office: Codable {
    let officeName: String
    let role: String
    let personEmail: String
}

class ISAOfficers: Codable {
    let officername: String
    let role: String
    let personEmail: String
    let officerPic: String
    let aboutOfficer: String
}

class SocialMedia: Codable {
    let isaEmail: String
    let instagram: String
    let facebook: String
}

