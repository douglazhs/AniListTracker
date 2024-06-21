//
//  Media.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation


public protocol MangaMedia { 
    var coverImage: MediaCoverImage? { get set }
    var bannerImage: String? { get set }
    var title: MediaTitle? { get set }
}

/// Short Manga result
public struct ShortMedia: Codable, MangaMedia {
    public var coverImage: MediaCoverImage?
    public var bannerImage: String?
    public var title: MediaTitle?
}

/// Manga
public struct Media: Identifiable, Equatable, Codable, MangaMedia {
    public static func == (lhs: Media, rhs: Media) -> Bool {
        lhs.id == rhs.id
    }
    
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
    public var isLicensed: Bool?
    public var genres: [String]?
    public var averageScore: Int?
    public var popularity: Int?
    public var favourites: Int?
    public var characters: CharacterConnection?
    public var staff: StaffConnection?
    public var rankings: [MediaRank]?
    public var mediaListEntry: MediaList?
    public var isAdult: Bool?
    public var siteUrl: String?
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
    public var score: CGFloat?
    public var progress: Int?
    public var progressVolumes: Int?
    public var updatedAt: Int?
    public var startedAt: FuzzyDate?
    public var completedAt: FuzzyDate?
}

public struct MediaRank: Codable {
    public var id: Int
    public var rank: Int?
    public var type: String?
    public var format: String?
    public var allTime: Bool
    public var context: String?
}
