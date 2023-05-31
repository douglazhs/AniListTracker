//
//  ALServices+Mutation.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

// ALServices+Mutation
public extension ALServices {
    @discardableResult
    func update(media id: Int, token: String) async -> GraphQLResponse<AniListUpdateResponse>? {
        let response: GraphQLResponse<AniListUpdateResponse>? =  await request(
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
    
    @discardableResult
    func toggleFollow(of user: Int, token: String) async -> GraphQLResponse<AniListToggleResponse>? {
        let response: GraphQLResponse<AniListToggleResponse>? = await request(
            GraphQLQuery(
                query: Queries.toggleFollow(user).body
            ),
            token: token
        )
        return response
    }
}
