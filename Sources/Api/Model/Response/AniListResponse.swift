//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Response of GraphQL request for Authenticated User
public struct AniListViewerResponse: Codable {
    var Viewer: User?
}

/// Response of GraphQL request for User
public struct AniListUserResponse: Codable {
    var User: User?
}

/// Response of GraphQL request for User followers
public struct AniListPageResponse: Codable {
    var Page: Page?
}

/// Response of GraphQL request for User activity
public struct AniListActivityResponse: Codable {
    var Activity: ActivityUnion?
}

/// Response of GraphQL request for activity reply update
public struct AniListSaveReplyResponse: Codable {
    var SaveActivityReply: ActivityReplyMutation?
}

/// Response of GraphQL request for activity reply delete
public struct AniListDeleteReplyResponse: Codable {
    var DeleteActivityReply: Deleted?
}

/// Response of GraphQL request for activity delete
public struct AniListDeleteActivityResponse: Codable {
    var DeleteActivity: Deleted?
}

/// Response of GraphQL request for activity subscription toggle
public struct AniListToggleSubResponse: Codable {
    var ToggleActivitySubscription: ActivityUnionMutation?
}

/// Response of GraphQL request for media update
public struct AniListUpdateResponse: Codable {
    var data: SavedMediaListEntry?
}

/// Toggle user followers/following
public struct AniListToggleResponse: Codable {
    var data: ToggleFollow?
}

/// Response of GraphQL request for media
public struct AniListMediaResponse: Codable {
    var Media: Media?
}

/// Response of GraphQL request for activity like toggle
public struct AniListLikeResponse: Codable {
    var ToggleLikeV2: LikeableUnion?
}

/// Response of GraphQL request for manga favorite toggle
public struct AniListToggleMangaResponse: Codable {
    var data: ToggleManga?
}

/// Response of GraphQL request for staff favorite toggle
public struct AniListToggleStaffResponse: Codable {
    var data: ToggleStaff?
}

/// Response of GraphQL request for character favorite toggle
public struct AniListToggleCharacterResponse: Codable {
    var data: ToggleCharacter?
}
