//
//  Media.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Short Manga result
public struct ShortMedia: Codable {
    public var coverImage: MediaCoverImage?
    public var bannerImage: String?
    public var title: MediaTitle?
}

/// Manga
public struct Media: Codable {
    public var id: Int
    public var title: MediaTitle?
    public var format: String?
    public var status: String?
    public var description: String?
    public var startDate: FuzzyDate?
    public var endDate: FuzzyDate?
    public var chapters: Int?
    public var volumes: Int?
    public var countryOfOrigin: String?
    public var source: String?
    public var coverImage: MediaCoverImage?
    public var bannerImage: String?
    public var genres: [String]?
    public var averageScore: Int?
    public var popularity: Int?
    public var favourites: Int?
    public var characters: CharacterConnection?
    public var staff: StaffConnection?
    public var mediaListEntry: MediaList?
    public var isAdult: Bool?
}

public struct MediaTitle: Codable {
    public var romaji: String?
    public var english: String?
}

public struct FuzzyDate: Codable {
    public var year: Int?
    public var month: Int?
    public var day: Int?
}

public struct MediaCoverImage: Codable {
    public var extraLarge: String?
    public var large: String?
    public var medium: String?
    public var color: String?
}

public struct MediaList: Codable {
    public var userId: Int?
    public var status: String?
    public var progress: Int?
    public var progressVolumes: Int?
}
