//
//  ALServices+Toggle.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

public extension ALServices {
    @discardableResult
    func toggleFollow(of user: Int, token: String) async throws -> GraphQLResponse<AniListToggleResponse>? {
        let response: GraphQLResponse<AniListToggleResponse>? = try await request(
            GraphQLQuery(
                query: Queries.toggleFollow(user).body
            ),
            token: token
        )
        return response
    }
    
    @discardableResult
    func toggleLike(of id: Int, as type: LikeableType, token: String) async throws -> GraphQLResponse<AniListLikeResponse>? {
        let response: GraphQLResponse<AniListLikeResponse>? = try await request(
            GraphQLVariableQuery(
                query: Queries.toggleLike.body,
                variables: ALToggleLikeVars(
                    id: id,
                    type: type.id
                )
            ),
            token: token
        )
        return response
    }
}
