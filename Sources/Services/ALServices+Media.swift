//
//  // ALServices+Media.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

// ALServices+GetMedia
public extension ALServices {
    @discardableResult
    func update(media id: Int, token: String) async throws -> GraphQLResponse<AniListUpdateResponse>? {
        let response: GraphQLResponse<AniListUpdateResponse>? =  try await request(
            GraphQLVariableQuery(
                query: Queries.update.body,
                variables: ALUpdateVars(
                    mediaId: id,
                    status: ""
                )
            ),
            token: token
        )
        return response
    }
    
    func get(media id: Int, token: String? = nil) async throws -> Media? {
        let response: GraphQLResponse<AniListMediaResponse>? = try await request(
            GraphQLQuery(query: Queries.media(id).body),
            token: token
        )
        guard let data = response?.data else { return nil }
        return data.Media
    }
}
