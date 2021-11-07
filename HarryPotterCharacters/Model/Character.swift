//
//  Characters.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 04/11/2021.
//

import Foundation

struct Character: Decodable {
    var name: String?
    var gender: String?
    var house: String?
    var dateOfBirth: String?
    var patronus: String?
    var actor: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case house = "house"
        case dateOfBirth = "dateOfBirth"
        case patronus = "patronus"
        case actor = "actor"
    }
}
