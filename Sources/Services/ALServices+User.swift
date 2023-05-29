//
//  AniList+User.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// ALServices+User
public extension ALServices {
    func getUser(token: String) async -> User? {
        let userResponse: GraphQLResponse<AniListViewerResponse>? = await request(
            GraphQLQuery(query: Queries.viewer.body),
            token: token
        )
        guard let userResponse,
              let viewer = userResponse.data.Viewer
        else { return nil }
        return viewer
    }
        
    func getFollowers(of userId: Int) async -> [User]? {
        let followersResponse: GraphQLResponse<AniListPageResponse>? = await request(
            GraphQLQuery(query: Queries.followers(userId).body)
        )
        return followersResponse?.data.Page?.followers
    }
    
    func getFollowing(of userId: Int) async -> [User]? {
        let followingResponse: GraphQLResponse<AniListPageResponse>? = await request(
            GraphQLQuery(query: Queries.following(userId).body)
        )
        return followingResponse?.data.Page?.following
    }
}
