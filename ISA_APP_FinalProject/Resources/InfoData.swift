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
    let nameView: String
    let viewsYear: [viewsYearInfo]?
    let viewsSocial: [viewsSocialInfo]?
    let viewsContact: [viewsContactInfo]?
}

class viewsYearInfo: Codable {
    let yearStart: String
    let yearEnd: String
}

class viewsSocialInfo: Codable {
    let isaEmail: String
    let instagram: String
    let facebook: String
}

class viewsContactInfo: Codable {
    let positionName: String
    let positions: [Positions]
}

class Positions: Codable {
    let officername: String?
    let role: String?
    let personEmail: String?
    let officerPic: String?
    let aboutOfficer: String?
}



