//
//  Profile.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import Foundation

struct ProfileInfo: Codable {
    var FanDuelName: String
    var Team: String
    var Position: String
    var Height: Int
    var Weight: Int
    var College: String
    var Salary: Int?
    var Experience: Int?
    var BirthCity: String?
    var BirthState: String?
    var BirthCountry: String?
    var PhotoUrl: String
}
