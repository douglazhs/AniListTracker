//
//  LikeableType.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 03/06/23.
//

import Foundation

/// Likeable type
public enum LikeableType {
    case activity, activityReply
    
    /// Type identifier
    public var id: String {
        switch self {
        case .activity:      return "ACTIVITY"
        case .activityReply: return "ACTIVITY_REPLY"
        }
    }
}
