//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 03/06/23.
//

import Foundation

/// Activity reply
public struct ActivityReply: Identifiable, Equatable, Codable {
    public static func == (lhs: ActivityReply, rhs: ActivityReply) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    public var text: String?
    public var likeCount: Int?
    public var isLiked: Bool?
    public var createdAt: Int?
    public var user: ShortUser?
    public var likes: [ShortUser]?
}

public struct ActivityReplyMutation: Codable {
    public var id: Int
}

public struct Deleted: Codable {
    public var deleted: Bool
}
