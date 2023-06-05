//
//  ALServices+Search.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

// ALServices+Search
public extension ALServices {
    func search(manga search: String, token: String? = nil) async throws -> [Media]? {
        let response: GraphQLResponse<AniListPageResponse>? = try await request(
            GraphQLVariableQuery(
                query: Queries.search.body,
                variables: ALSearchVars(search: search)
            ),
            token: token
        )
        guard let data = response?.data,
              let page = data.Page
        else { return nil }
        return page.media
    }
}
