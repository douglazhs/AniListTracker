//
//  Character.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Manga Character
public struct CharacterConnection: Codable {
    var edges: [CharacterEdge]?
}

public struct CharacterEdge: Codable {
    var node: Character
    var id: Int
    var role: String?
}

public struct Character: Codable {
    var id: Int
    var name: CharacterName?
    var image: CharacterImage?
    var description: String?
}

public struct CharacterName: Codable {
    var full: String?
}

public struct CharacterImage: Codable {
    var large: String?
}
