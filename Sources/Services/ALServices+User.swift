//
//  AniList+User.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// ALServices+User
public extension ALServices {
    func getAuthUser(token: String) async throws -> User? {
        let userResponse: GraphQLResponse<AniListViewerResponse>? = try await request(
            GraphQLQuery(query: Queries.viewer.body),
            token: token
        )
        guard let userResponse,
              let viewer = userResponse.data.Viewer
        else { return nil }
        return viewer
    }
    
    func getUser(by id: Int, token: String) async throws -> User? {
        let userResponse: GraphQLResponse<AniListUserResponse>? = try await request(
            GraphQLQuery(query: Queries.user(id).body),
            token: token
        )
        guard let userResponse,
              let user = userResponse.data.User
        else { return nil }
        return user
    }
        
    func getFollowers(of userId: Int, token: String? = nil) async throws -> [User]? {
        let followersResponse: GraphQLResponse<AniListPageResponse>? = try await request(
            GraphQLQuery(query: Queries.followers(userId).body),
            token: token
        )
        return followersResponse?.data.Page?.followers
    }
    
    func getFollowing(of userId: Int, token: String? = nil) async throws -> [User]? {
        let followingResponse: GraphQLResponse<AniListPageResponse>? = try await request(
            GraphQLQuery(query: Queries.following(userId).body),
            token: token
        )
        return followingResponse?.data.Page?.following
    }
}
