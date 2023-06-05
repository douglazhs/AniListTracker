//
//  ApiSetup.swift
//  Orochii
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// Api setup, such as: `ID`, `SECRET` and `REDIRECT URL`
public class ApiSetup: Codable {
    enum BundleError: Swift.Error {
        case fileNotFound(name: String)
        case fileDecodingFailed(name: String, Swift.Error)
    }
    public let id: Int
    public let secret: String
    public let name: String
    public let redirectURL: URL
    
    public init(id: Int, secret: String, name: String, redirectURL: URL) {
        self.id = id
        self.secret = secret
        self.name = name
        self.redirectURL = redirectURL
    }
    
    /// Load API informations from bundle
    /// - Returns: API informations to make the Auth request
    public static func load() throws -> ApiSetup {
        do {
            guard let filePath = Bundle.main.url(
                forResource: "anilist_api",
                withExtension: "json"
            ) else { throw BundleError.fileNotFound(name: "anilist_api") }
            let data = try Data(contentsOf: filePath)
            let object = try JSONDecoder().decode(ApiSetup.self, from: data)
            return object
        } catch {
            throw BundleError.fileDecodingFailed(name: "anilist_api", error)
        }
    }
}
