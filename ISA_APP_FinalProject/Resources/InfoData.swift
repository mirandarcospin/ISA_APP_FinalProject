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



