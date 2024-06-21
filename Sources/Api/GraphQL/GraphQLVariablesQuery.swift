//
//  GraphQLVariablesQuery.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// GraphQL query with variables
public struct GraphQLVariableQuery<T: Codable>: Codable {
    var query: String
    var variables: T?
}

/// AniList update media variables
public struct ALUpdateVars: Codable {
    var mediaId: Int
    var status: String
}

/// AniList search media variables
public struct ALSearchVars: Codable {
    var search: String
}

/// AniList update reply variables
public struct ALUpdateReplyVars: Codable {
    var id: Int
    var text: String
}

/// AniList create reply variables
public struct ALCreateReplyVars: Codable {
    var activityId: Int
    var text: String
}

/// AniList delete reply variables
public struct ALDeleteReplyVars: Codable {
    var id: Int
}

/// AniList toggle likes vars
public struct ALToggleLikeVars: Codable {
    var id: Int
    var type: String
}

/// AniList toggle activity subscription vars
public struct ALToggleSubVars: Codable {
    var activityId: Int
    var subscribe: Bool
}

public struct ALToggleFavoriteVars: Codable {
    var characterId: Int
}
