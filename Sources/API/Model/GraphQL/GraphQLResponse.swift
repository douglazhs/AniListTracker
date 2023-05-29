//
//  GraphQLResponse.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/23.
//

import Foundation

/// GraphQL response
public struct GraphQLResponse<T: Codable>: Codable {
    var data: T
}
