//
//  Media.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Manga
public struct Media: Codable {
    var id: Int
    var title: MediaTitle?
    var format: String?
    var status: String?
    var description: String?
    var startDate: FuzzyDate?
    var endDate: FuzzyDate?
    var chapters: Int?
    var volumes: Int?
    var countryOfOrigin: String?
    var source: String?
    var coverImage: MediaCoverImage?
    var bannerImage: String?
    var genres: [String]?
    var averageScore: Int?
    var popularity: Int?
    var favourites: Int?
    var characters: CharacterConnection?
    var staff: StaffConnection?
    var mediaListEntry: MediaList?
    var isAdult: Bool?
}

public struct MediaTitle: Codable {
    var romaji: String?
    var english: String?
}

public struct FuzzyDate: Codable {
    var year: Int?
    var month: Int?
    var day: Int?
}

public struct MediaCoverImage: Codable {
    var extraLarge: String?
}

public struct MediaList: Codable {
    var userId: Int?
    var status: String?
    var progress: Int?
    var progressVolumes: Int?
}
