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
