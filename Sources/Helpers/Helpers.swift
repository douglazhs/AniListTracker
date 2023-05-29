//
//  Helpers.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// Anilist service helpers
public protocol Helpers {
    /// Safe URL to AniList authorize Website
    /// - Parameters:
    ///   - clientID: AniList site client ID
    ///   - domain: Anilist requisition domain
    /// - Returns: Built URL
    func authUrlBuilder(clientID: Int, domain: String) -> URL
    
    /// Process URL after get the authorization response
    /// - Parameter url: Received URL wiht the access `token`
    func getToken(from url: URL) -> [String:String]
    
    /// Build authenticated request
    /// - Parameter data: Query data
    /// - Returns: Request object
    func request<T: Codable, D: Encodable>(_ data: D, token: String?) async -> T?
}
