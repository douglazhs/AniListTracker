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
    case search, user(Int), followers(Int), following(Int), media(Int), activities(Int), userActivities(Int, Int), activity(Int)
    /// Mutable queries
    case update, toggleFollow(Int), updateReply, deleteReply(Int), deleteActivity(Int), createReply, toggleLike, toggleSubscribe,
    toggleFavManga, toggleFavCharacter, toggleFavStaff
    
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
                        medium
                    }
                    bannerImage
                    mediaListOptions {
                        scoreFormat
                    }
                   favourites {
                       manga(perPage: 25) {
                           nodes {
                                \(mediaAttributes)
                           }
                       }
                       characters {
                            nodes {
                                id
                                name {
                                    first
                                    middle
                                    last
                                    full
                                    native
                                    alternative
                                    alternativeSpoiler
                                    userPreferred
                                }
                                image {
                                    medium
                                    large
                                }
                                description
                                gender
                                age
                                isFavourite
                                favourites
                                media(type: MANGA, sort: POPULARITY_DESC) {
                                    nodes {
                                        \(mediaAttributes)
                                    }
                                }
                            }
                        }
                        staff {
                            nodes {
                                id
                                name {
                                    first
                                    last
                                    full
                                    native
                                    alternative
                                    userPreferred
                                }
                                languageV2
                                image {
                                    large
                                    medium
                                }
                                description(asHtml: false)
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
                                isFavourite
                                siteUrl
                                favourites
                            }
                        }
                    }
                    statistics {
                        manga {
                            count
                            meanScore
                            chaptersRead
                            volumesRead
                            statuses {
                                count
                                chaptersRead
                                status
                            }
                            genres(limit: 10) {
                                count
                                chaptersRead
                                genre
                            }
                            tags(limit: 10) {
                                count
                                chaptersRead
                                tag {
                                    id
                                    name
                                }
                            }
                            startYears {
                                count
                                chaptersRead
                                startYear
                            }
                            countries {
                                count
                                chaptersRead
                                mediaIds
                                country
                            }
                        }
                    }
                    siteUrl
                }
            }
            """
        case .search:
            return """
            query($search: String, $format: MediaFormat = MANGA) {
                Page {
                    media(search: $search, format: $format) {
                        \(mediaAttributes)
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
                        medium
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
                            medium
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
                            medium
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
                    \(mediaAttributes)
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
                    status
                    score
                    progress
                    startedAt
                    completedAt
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
        case .activities(let page):
            return """
            query($isFollowing: Boolean = true, $hasReplies: Boolean = false, $activityType: ActivityType, $page: Int = \(page)) {
                Page(page: $page, perPage: 25) {
                    activities(isFollowing: $isFollowing, type: $activityType, hasRepliesOrTypeText: $hasReplies, type_in: [MANGA_LIST], sort: ID_DESC) {
                        ... on ListActivity {
                            id
                            userId
                            status
                            progress
                            isSubscribed
                            likeCount
                            isLiked
                            siteUrl
                            createdAt
                            user {
                                id
                                name
                                avatar {
                                    large
                                    medium
                                }
                            }
                            media {
                                coverImage {
                                    extraLarge
                                    large
                                    medium
                                    color
                                }
                                bannerImage
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
                                        medium
                                    }
                                }
                                likes {
                                    id
                                    name
                                    avatar {
                                        large
                                        medium
                                    }
                                }
                            }
                            likes {
                                id
                                name
                                avatar {
                                    large
                                    medium
                                }
                            }
                        }
                    }
                }
            }
            """
        case .userActivities(let userId, let page):
            return """
            query($userId: Int = \(userId), $page: Int = \(page)) {
                Page(page: $page, perPage: 25) {
                    activities(userId: $userId, type: MANGA_LIST, sort: [ID_DESC]) {
                        ... on ListActivity {
                            id
                            userId
                            status
                            progress
                            isSubscribed
                            likeCount
                            isLiked
                            siteUrl
                            createdAt
                            user {
                                id
                                name
                                avatar {
                                    large
                                    medium
                                }
                            }
                            media {
                                coverImage {
                                    extraLarge
                                    large
                                    medium
                                    color
                                }
                                bannerImage
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
                                        medium
                                    }
                                }
                                likes {
                                    id
                                    name
                                    avatar {
                                        large
                                        medium
                                    }
                                }
                            }
                            likes {
                                id
                                name
                                avatar {
                                    large
                                    medium
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
                        userId
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
                                large
                                medium
                                color
                            }
                            bannerImage
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
                                    medium
                                }
                            }
                            likes {
                                id
                                name
                                avatar {
                                    large
                                    medium
                                }
                            }
                        }
                        likes {
                            id
                            name
                            avatar {
                                large
                                medium
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
        case .toggleFavManga:
            return """
            mutation($mangaId: Int) {
                ToggleFavourite(mangaId: $mangaId) {
                    manga {
                        nodes {
                            id
                        }
                    }
                }
            }
            """
        case .toggleFavCharacter:
            return """
            mutation($characterId: Int) {
                ToggleFavourite(characterId: $characterId) {
                    characters {
                        nodes {
                            id
                        }
                    }
                }
            }
            """
        case .toggleFavStaff:
            return """
            mutation($staffId: Int) {
                ToggleFavourite(staffId: $staffId) {
                    staff {
                        nodes {
                            id
                        }
                    }
                }
            }
            """
        }
    }
}
