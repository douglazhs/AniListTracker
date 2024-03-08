//
//  UserMock.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 07/03/24.
//

import Foundation

public class UserMock {
    public static var user: User = User(
        id: 242286,
        name: "douglazhs",
        avatar: UserAvatar(
            large: "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b242286-2LVvxR1xJYr8.jpg"
        ),
        bannerImage: "https://s4.anilist.co/file/anilistcdn/user/banner/b242286-TwkkglJDOtEY.jpg",
        statistics: UserStatisticTypes(
            manga: UserStatistics(
                count: 18,
                meanScore: 85,
                chaptersRead: 3108,
                volumesRead: 192
            )
        )
    )
}
