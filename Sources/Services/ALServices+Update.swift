//
//  ALServices+Update.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

// ALServices+Update
public extension ALServices {
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
}
