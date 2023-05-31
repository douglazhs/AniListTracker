//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Response of GraphQL request for User
public struct AniListViewerResponse: Codable {
    var Viewer: User?
}

/// Response of GraphQL request for User followers
public struct AniListPageResponse: Codable {
    var Page: Page?
}

/// Response of GraphQL request for media update
public struct AniListUpdateResponse: Codable {
    var data: SavedMediaListEntry?
}

public struct AniListToggleResponse: Codable {
    var data: ToggleFollow?
}

/// Response of GraphQL request for media
public struct AniListMediaResponse: Codable {
    var Media: Media?
}
