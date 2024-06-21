//
//  Staff.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Manga staff
public struct Staff: Codable {
    public var id: Int
    public var name: StaffName?
    public var languageV2: String?
    public var image: StaffImage?
    public var description: String?
    public var primaryOcupations: [String]?
    public var gender: String?
    public var dateOfBirth: FuzzyDate?
    public var dateOfDeath: FuzzyDate?
    public var age: Int?
    public var yearsActive: [Int]?
    public var homeTown: String?
    public var isFavourite: Bool?
    public var siteUrl: String?
    public var favourites: Int?
    public var staffMedia: MediaConnection?
}

public struct StaffName: Codable {
    public var first: String?
    public var last: String?
    public var full: String?
    public var native: String?
    public var alternative: [String]?
    public var userPreferred: String?
}

public struct StaffImage: Codable {
    public var large: String?
    public var medium: String?
}
