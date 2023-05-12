//
//  Helpers+AuthUrlBuilder.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// Helpers+AuthUrlBuilder
public extension Helpers {
    func authUrlBuilder(clientID: Int, domain: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = domain
        components.path = "/api/v2/oauth/authorize"
        components.queryItems =
            [
                "client_id": String(clientID),
                "response_type": "token"
            ].map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
