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
    func logIn(response: @escaping (Result) -> Void)
    
    /// Get user informations from AniList account
    /// - Returns: User object
    func getUser(token: String) async -> User?
    
    /// Get user followers
    /// - Parameters:
    ///   - userId: Logged user Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Followers Array
    func getFollowers(of userId: Int) async -> [User]?
    
    /// Get user following users
    /// - Parameters:
    ///   - userId: Logged user Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Following users Array
    func getFollowing(of userId: Int) async -> [User]?
    
    @discardableResult
    /// Update media
    /// - Parameters:
    ///   - id: Media Id
    ///   - token: Bearer of the authenticated user
    func update(media id: Int, token: String) async -> GraphQLResponse<AniListUpdateResponse>?
    
    /// Get manga by Id
    /// - Parameters:
    ///   - id: Media Id
    ///   - token: Bearer of the authenticated user
    /// - Returns: Manga media based on Id
    func get(media id: Int, token: String?) async -> Media?
    
    /// Search manga by name
    /// - Parameter search: Manga name
    /// - Returns: Manga results Array
    func search(manga search: String, token: String?) async -> [Media]?
}
