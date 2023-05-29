//
//  // ALServices+GetMedia.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

// ALServices+GetMedia
public extension ALServices {
    func get(media id: Int, token: String? = nil) async -> Media? {
        let response: GraphQLResponse<AniListMediaResponse>? = await request(
            GraphQLQuery(query: Queries.media(id).body),
            token: token
        )
        guard let data = response?.data else { return nil }
        return data.Media
    }
}
