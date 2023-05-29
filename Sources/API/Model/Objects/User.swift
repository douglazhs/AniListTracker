//
//  User.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

/// AniList User
public struct User: Codable {
    public var id: Int
    public var name: String
    public var about: String?
    public var avatar: UserAvatar?
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
    public var manga: UserStatistics
}

public struct UserStatistics: Codable {
    public var count: Int?
    public var meanScore: Double?
    public var chaptersRead: Int?
    public var volumesRead: Int?
}
