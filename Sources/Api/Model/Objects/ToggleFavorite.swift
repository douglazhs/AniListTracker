//
//  ToggleFavorite.swift
//
//
//  Created by Douglas Henrique de Souza Pereira on 20/06/24.
//

import Foundation

/// Toggle favorite manga
public struct ToggleManga: Codable {
    public var manga: MediaConnection?
}

/// Toggle favorite character
public struct ToggleCharacter: Codable {
    public var characters: CharacterFavConnection?
}

/// Toggle favorite staff
public struct ToggleStaff: Codable {
    public var staff: StaffFavConnection?
}
