//
//  Characters.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 04/11/2021.
//

import Foundation

struct Character: Decodable {
    var name: String?
    var house: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case house = "house"
    }
}
