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
    case search, user(Int), followers(Int), following(Int), media(Int), activities(Int), activity(Int)
    /// Mutable queries
    case update, toggleFollow(Int), updateReply, deleteReply(Int), deleteActivity(Int), createReply, toggleLike, toggleSubscribe
    
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
                            genres(limit: 8) {
                                chaptersRead
                                genre
                            }
                            startYears {
                                chaptersRead
                                startYear
                            }
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
        case .user(let id):
           return """
            query($id: Int = \(id)) {
                User(id: $id) {
                    id
                    name
                    about
                    avatar {
                        large
                    }
                    bannerImage
                    mediaListOptions {
                        scoreFormat
                        animeList {
                            sectionOrder
                            customLists
                        }
                        mangaList {
                            sectionOrder
                            customLists
                        }
                    }
                    statistics {
                        manga {
                            count
                            meanScore
                            chaptersRead
                            volumesRead
                            genres(limit: 8) {
                                chaptersRead
                                genre
                            }
                            startYears {
                                chaptersRead
                                startYear
                            }
                        }
                    }
                    siteUrl
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
                        about
                        avatar {
                            large
                        }
                        bannerImage
                        isFollowing
                        isFollower
                        statistics {
                            manga {
                                count
                                meanScore
                                chaptersRead
                                volumesRead
                                genres(limit: 8) {
                                    chaptersRead
                                    genre
                                }
                                startYears {
                                    chaptersRead
                                    startYear
                                }
                            }
                        }
                        siteUrl
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
                        about
                        avatar {
                            large
                        }
                        bannerImage
                        isFollowing
                        isFollower
                        statistics {
                            manga {
                                count
                                meanScore
                                chaptersRead
                                volumesRead
                                genres(limit: 8) {
                                    chaptersRead
                                    genre
                                }
                                startYears {
                                    chaptersRead
                                    startYear
                                }
                            }
                        }
                        siteUrl
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
                    status(version: 2)
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
        case .toggleFollow(let userId):
            return """
            mutation($userId: Int = \(userId)) {
                ToggleFollow(userId: $userId) {
                    id
                }
            }
            """
        case .activities(let userId):
            return """
            query($userId: Int = \(userId)) {
                Page {
                    activities(userId: $userId, type: MANGA_LIST, sort: [ID_DESC]) {
                        ... on ListActivity {
                            id
                            status
                            progress
                            isSubscribed
                            likeCount
                            isLiked
                            siteUrl
                            createdAt
                            media {
                                coverImage {
                                    extraLarge
                                }
                                title {
                                    romaji
                                    english
                                }
                            }
                            replies {
                                id
                                text
                                likeCount
                                isLiked
                                createdAt
                                user {
                                    id
                                    name
                                    avatar {
                                        large
                                    }
                                }
                                likes {
                                    id
                                    name
                                    avatar {
                                        large
                                    }
                                }
                            }
                        }
                    }
                }
            }
            """
        case .activity(let id):
            return """
            query ($id: Int = \(id)) {
                Activity(id: $id) {
                    ... on ListActivity {
                        id
                        status
                        progress
                        isSubscribed
                        likeCount
                        isLiked
                        siteUrl
                        createdAt
                        media {
                            coverImage {
                            extraLarge
                            }
                            title {
                            romaji
                            english
                            }
                        }
                        replies {
                            id
                            text
                            likeCount
                            isLiked
                            createdAt
                            user {
                                id
                                name
                                avatar {
                                    large
                                }
                            }
                            likes {
                                id
                                name
                                avatar {
                                    large
                                }
                            }
                        }
                        likes {
                            id
                            name
                            avatar {
                                large
                            }
                        }
                    }
                }
            }
            """
        case .updateReply:
            return """
            mutation($id: Int, $text: String) {
                SaveActivityReply(id: $id, text: $text) {
                    id
                }
            }
            """
        case .deleteReply(let id):
            return """
            mutation($id: Int = \(id)) {
                DeleteActivityReply(id: $id) {
                    ... on Deleted {
                        deleted
                    }
                }
            }
            """
        case .deleteActivity(let id):
            return """
            mutation($id: Int = \(id)) {
                DeleteActivity(id: $id) {
                    deleted
                }
            }
            """
        case .createReply:
            return """
            mutation($activityId: Int, $text: String) {
                SaveActivityReply(activityId: $activityId, text: $text) {
                    id
                }
            }
            """
        case .toggleLike:
            return """
            mutation($id: Int, $type: LikeableType) {
                ToggleLikeV2(id: $id, type: $type) {
                    ... on ActivityReply {
                        id
                    }
                }
            }
            """
        case .toggleSubscribe:
            return """
            mutation($activityId: Int, $subscribe: Boolean) {
                ToggleActivitySubscription(activityId: $activityId, subscribe: $subscribe) {
                    ... on ListActivity {
                        id
                    }
                }
            }
            """
        }
    }
}
