//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/23.
//

import Foundation

/// All URLs used on AniList Services Package
public enum URLs: CustomStringConvertible {
    case ALBaseReq
    
    /// URL
    public var description: String {
        switch self {
        case .ALBaseReq: return "https://graphql.anilist.co"
        }
    }
}
