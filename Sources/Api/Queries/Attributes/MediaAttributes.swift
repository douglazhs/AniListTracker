//
//  MediaAttributes.swift
//
//
//  Created by Douglas Henrique de Souza Pereira on 20/06/24.
//

import Foundation

let mediaAttributes = """
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
    source(version: 3)
    coverImage {
        extraLarge
        large
        medium
        color
    }
    bannerImage
    isLicensed
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
    rankings {
        id
        rank
        type
        format
        allTime
        context
    }
    mediaListEntry {
        userId
        status
        score
        progress
        progressVolumes
        updatedAt
        startedAt {
            year
            month
            day
        }
        completedAt {
            year
            month
            day
        }
    }
    isAdult
    siteUrl
"""
