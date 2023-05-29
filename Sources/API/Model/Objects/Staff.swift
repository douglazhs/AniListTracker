//
//  Staff.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Manga staff
public struct StaffConnection: Codable {
    var edges: [StaffEdge]?
}

public struct StaffEdge: Codable {
    var node: Staff?
    var id: Int
    var role: String?
}

public struct Staff: Codable {
    var id: Int
    var name: StaffName?
    var languageV2: String?
    var image: StaffImage?
    var description: String?
    var primaryOcupations: [String]?
    var gender: String?
    var dateOfBirth: FuzzyDate?
    var dateOfDeath: FuzzyDate?
    var age: Int?
    var yearsActive: [Int]?
    var homeTown: String?
}

public struct StaffName: Codable {
    var full: String?
    var native: String?
}

public struct StaffImage: Codable {
    var large: String?
}
