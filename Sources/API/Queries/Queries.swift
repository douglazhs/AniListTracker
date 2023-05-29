//
//  AniListQueries.swift
//  Orochii
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

/// All AniList queries
public enum Queries {
    /// Authenticated queries
    case viewer
    /// Normal query
    case search, followers(Int), following(Int), media(Int)
    /// Mutable queries
    case update
    
    var body: String {
        switch self {
        case .viewer:
            return """
            query {
                Viewer {
                    id
                    name
                    about
                    avatar {
                        large
                    }
                    bannerImage
                    mediaListOptions {
                        scoreFormat
                    }
                    statistics {
                        manga {
                            count
                            meanScore
                            chaptersRead
                            volumesRead
                        }
                    }
                    siteUrl
                }
            }
            """
        case .search:
            return """
            query($search: String) {
                Page {
                    media(search: $search, type: MANGA) {
                        id
                        title {
                            romaji
                            english
                        }
                        chapters
                        volumes
                        source
                        format
                        mediaListEntry {
                            status
                        }
                    }
                }
            }
            """
        case .followers(let userId):
            return """
            query($userID: Int = \(userId)) {
              Page {
                    followers(userId: $userID) {
                        id
                        name
                    }
                }
            }
            """
        case .following(let userId):
            return """
            query($userID: Int = \(userId)) {
              Page {
                    following(userId: $userID) {
                        id
                        name
                    }
                }
            }
            """
        case .media(let id):
            return """
            query ($id: Int = \(id)) {
                Media(id: $id) {
                    id
                    title {
                        romaji
                        english
                    }
                    format
                    status
                    description(asHtml: false)
                    startDate {
                        year
                        month
                        day
                    }
                    endDate {
                        year
                        month
                        day
                    }
                    chapters
                    volumes
                    countryOfOrigin
                    source
                    coverImage {
                        extraLarge
                    }
                    bannerImage
                    genres
                    averageScore
                    popularity
                    favourites
                    characters {
                        edges {
                            node {
                                id
                                name {
                                    full
                                }
                                image {
                                    large
                                }
                                description
                            }
                            id
                            role
                        }
                    }
                    staff {
                        edges {
                            id
                            role
                            node {
                                id
                                name {
                                    full
                                    native
                                }
                                languageV2
                                image {
                                    large
                                }
                                description
                                primaryOccupations
                                gender
                                dateOfBirth {
                                    year
                                    month
                                    day
                                }
                                dateOfDeath {
                                    year
                                    month
                                    day
                                }
                                age
                                yearsActive
                                homeTown
                            }
                        }
                    }
                    mediaListEntry {
                        userId
                        status
                    }
                    isAdult
                }
            }
            """
        case.update:
            return """
            mutation(
                $mediaId: Int,
                $status: MediaListStatus
            ) {
                SaveMediaListEntry(
                    mediaId: $mediaId
                    status: $status
                ) {
                    id
                }
            }
            """
        }
    }
}
