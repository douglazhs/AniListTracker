//
//  User.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

public struct ShortUser: Identifiable, Codable {
    public var id: Int
    public var name: String?
    public var avatar: UserAvatar?
}

/// AniList User
public struct User: Identifiable, Codable {
    public var id: Int
    public var name: String
    public var about: String?
    public var avatar: UserAvatar?
    public var isFollowing: Bool?
    public var isFollower: Bool?
    public var bannerImage: String?
    public var mediaListOptions: MediaListOptions?
    public var statistics: UserStatisticTypes?
    public var siteUrl: String?
}

public struct UserAvatar: Codable {
    public var large: String?
}

public struct MediaListOptions: Codable {
    public var scoreFormat: String?
}

public struct UserStatisticTypes: Codable {
    public var manga: UserStatistics?
}

public struct UserStatistics: Codable {
    public var count: Int?
    public var meanScore: Double?
    public var chaptersRead: Int?
    public var volumesRead: Int?
    public var startYears: [UserStartYearStatistic]?
    public var genres: [UserGenreStatistic]?
}

public struct UserGenreStatistic: Codable {
    public var chaptersRead: Int?
    public var genre: String?
}

public struct UserStartYearStatistic: Codable {
    public var chaptersRead: Int?
    public var startYear: Int?
}


