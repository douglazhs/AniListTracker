//
//  Helpers+ResponseUrl.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Foundation

/// Helpers+ResponseUrl
public extension Helpers {
    func processResponseURL(url: URL) -> [String:String] {
        let anilistComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        if  let anilistFragment = anilistComponents?.fragment,
            let dummyURL = URL(string: "http://dummyurl.com?\(anilistFragment)"),
            let components = URLComponents(url: dummyURL, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems,
            let token = queryItems.filter ({ $0.name == "access_token" }).first?.value,
            let expirationDate = queryItems.filter ({ $0.name == "expires_in" }).first?.value
            {
            return ["access_token":token, "expires_in":expirationDate]
        }
        return [:]
    }
}
