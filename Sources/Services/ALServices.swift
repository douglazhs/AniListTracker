//
//  ALServices.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Combine

/// All AniList services in the app
public protocol ALServices: Helpers {
    /// SignIn AniList account
    func logIn(response: @escaping (LoginResult) -> Void)
    
    /// Get user informations from AniList account
    /// - Parameter token: Bearer of the authenticated user
    /// - Returns: User object
    func getAuthUser(token: String) async throws -> User?
    
    /// Get user informations from AniList account
    /// - Parameter token: Bearer of the authenticated user
    /// - Returns: User object
    func getUser(by id: Int, token: String) async throws -> User?
    
    /// Get user followers
    /// - Parameters:
    ///   - userId: Logged user Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Followers Array
    func getFollowers(of userId: Int, token: String?) async throws -> [User]?
    
    /// Get user following users
    /// - Parameters:
    ///   - userId: Logged user Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Following users Array
    func getFollowing(of userId: Int, token: String?) async throws -> [User]?
    
    /// Update media
    /// - Parameters:
    ///   - id: Media Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func update(media id: Int, token: String) async throws -> GraphQLResponse<AniListUpdateResponse>?
    
    /// Get manga by Id
    /// - Parameters:
    ///   - id: Media Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Manga media based on Id
    func get(media id: Int, token: String?) async throws -> Media?
    
    /// Search manga by name
    /// - Parameter search: Manga name
    /// - Returns: Manga results Array
    func search(manga search: String, token: String?) async throws -> [Media]?
    
    /// Follow/Unfollow user
    /// - Parameters:
    ///   - user: User to be followed/unfollowed
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func toggleFollow(of user: Int, token: String) async throws -> GraphQLResponse<AniListToggleResponse>?
    
    /// Get all activities of the user
    /// - Parameters:
    ///   - user: Current user
    ///   - token: Bearer of the authenticated user
    /// - Returns: Activities results Array
    func getActivities(of user: Int?, token: String?, page: Int) async throws -> [ActivityUnion]?
    
    /// Get a specific activity by Id
    /// - Parameters:
    ///   - id: Activity Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Acitvity
    func getActivity(id: Int, token: String?) async throws -> ActivityUnion?
    
    /// Create an user activity reply
    /// - Parameters:
    ///   - activiyId: Related activity Id
    ///   - text: Reply text
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func createReply(activiyId: Int, text: String, token: String) async throws -> AniListSaveReplyResponse?
    
    /// Update an user activity reply
    /// - Parameters:
    ///   - id: Reply Id
    ///   - text: Reply text
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func updateReply(id: Int, text: String, token: String) async throws -> AniListSaveReplyResponse?
    
    /// Delete an user activity reply
    /// - Parameters:
    ///   - id: Reply Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func deleteReply(id: Int, token: String) async throws -> AniListDeleteReplyResponse?
    
    
    /// Delete an user activity 
    /// - Parameters:
    ///   - id: Activity Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func deleteActivity(with id: Int, token: String) async throws -> GraphQLResponse<AniListDeleteActivityResponse>?
    
    /// Toggle like of a likeable type
    /// - Parameters:
    ///   - id: Likeable object
    ///   - type: Likeable object type
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func toggleLike(of id: Int, as type: LikeableType, token: String) async throws -> GraphQLResponse<AniListLikeResponse>?
    
    /// Toggle activity subscription
    /// - Parameters:
    ///   - id: Activity Id
    ///   - subscribe: un/subscribe
    ///   - token: Bearer of the authenticated user
    /// - Returns: GraphQL discardable result
    func toggleSubscription(id: Int, subscribe: Bool, token: String) async throws -> GraphQLResponse<AniListToggleSubResponse>?
}
