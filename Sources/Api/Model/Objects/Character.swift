//
//  Character.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Manga character
public struct Character: Identifiable, Equatable, Hashable, Codable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) { }
    
    public var id: Int
    public var name: CharacterName?
    public var image: CharacterImage?
    public var description: String?
    public var gender: String?
    public var age: String?
    public var isFavourite: Bool?
    public var favourites: Int?
    public var media: MediaConnection?
}

public struct CharacterName: Codable {
    public var first: String?
    public var middle: String?
    public var last: String?
    public var full: String?
    public var native: String?
    public var alternative: [String]?
    public var alternativeSpoiler: [String]?
    public var userPreferred: String?
}

public struct CharacterImage: Codable {
    public var medium: String?
    public var large: String?
}
