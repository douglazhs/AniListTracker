//
//  User.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

public struct ShortUser: Identifiable, Codable, Equatable {
    public static func == (lhs: ShortUser, rhs: ShortUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    public var name: String?
    public var avatar: UserAvatar?
}

/// AniList User
public struct User: Identifiable, Codable, Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: Int
    public var name: String
    public var about: String?
    public var avatar: UserAvatar?
    public var isFollowing: Bool?
    public var isFollower: Bool?
    public var bannerImage: String?
    public var mediaListOptions: MediaListOptions?
    public var favourites: Favourites?
    public var statistics: UserStatisticTypes?
    public var siteUrl: String?
}

public struct UserAvatar: Codable {
    public var large: String?
    public var medium: String?
}

public struct MediaListOptions: Codable {
    public var scoreFormat: String?
}

public struct Favourites: Codable {
    public var manga: MediaConnection?
}

public struct MediaConnection: Codable {
    public var nodes: [Media]?
}

public struct UserStatisticTypes: Codable {
    public var manga: UserStatistics?
}

public struct UserStatistics: Codable {
    public var count: Int?
    public var meanScore: Double?
    public var chaptersRead: Int?
    public var volumesRead: Int?
    public var statuses: [UserStatusStatistic]?
    public var startYears: [UserStartYearStatistic]?
    public var genres: [UserGenreStatistic]?
    public var tags: [UserTagStatistic]?
    public var countries: [UserCountryStatistic]?
}

public struct UserStatusStatistic: Codable {
    public var count: Int?
    public var chaptersRead: Int?
    public var status: String?
}

public struct UserGenreStatistic: Codable {
    public var count: Int?
    public var chaptersRead: Int?
    public var genre: String?
}

public struct UserStartYearStatistic: Codable {
    public var count: Int?
    public var chaptersRead: Int?
    public var startYear: Int?
}

public struct UserCountryStatistic: Codable {
    public var count: Int?
    public var chaptersRead: Int?
    public var mediaIds: [Int]?
    public var country: String?
}

public struct UserTagStatistic: Codable {
    public var count: Int?
    public var chaptersRead: Int?
    public var tag: MediaTag?
}

