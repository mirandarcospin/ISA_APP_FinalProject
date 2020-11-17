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
    let nameView: [NameView]
}

class NameView: Codable {
    let views: [Views]
}

class Views: Codable {
    let viewInfoSettings: [InfoSettings]
    let viewInfoContacts: [InfoContacts]
}

class InfoSettings: Codable {
    let profile: String
    let notifications: String
    let chapel: String
    let events: String
    let pictures: String
    let settings: String
}

class InfoContacts: Codable {
    let positionName: String
    let positions: [Positions]
}

class Positions: Codable {
    let officername: String?
    let role: String?
    let personEmail: String?
    let officerPic: String?
    let aboutOfficer: String?
    let isaEmail: String?
    let instagram: String?
    let facebook: String?
}

