//
//  ActivityUnion.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 31/05/23.
//

import Foundation

/// User activity
public struct ActivityUnion: Identifiable, Codable, Equatable {
    public static func == (lhs: ActivityUnion, rhs: ActivityUnion) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: Int
    public var userId: Int
    public var status: String?
    public var progress: String?
    public var isSubscribed: Bool?
    public var likeCount: Int?
    public var isLiked: Bool?
    public var siteUrl: String?
    public var createdAt: Int?
    public var media: ShortMedia?
    public var replies: [ActivityReply]?
    public var likes: [ShortUser]?
}

/// Object to make mutation requests
public struct ActivityUnionMutation: Codable {
    public var id: Int
}
