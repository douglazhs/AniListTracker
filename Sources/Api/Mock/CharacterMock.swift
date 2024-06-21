//
//  CharacterMock.swift
//
//
//  Created by Douglas Henrique de Souza Pereira on 19/06/24.
//

import Foundation

public struct CharacterMock {
    public static var character: Character {
        return Character(
            id: 45627,
            name: .init(first: "Levi", full: "Levi"),
            image: .init(
                medium: "https://s4.anilist.co/file/anilistcdn/character/medium/b45627-CR68RyZmddGG.png",
                large: "https://s4.anilist.co/file/anilistcdn/character/large/b45627-CR68RyZmddGG.png"
            ),
            description: "__Height:__ 160 cm (5'3\") \n__Affiliation:__ Survey Corps; Squad Captain, Special Operations Squad\n\nSquad Captain of the Special Operations Squad (known as Squad Levi) within the Survey Corps. He is known as humanity's strongest soldier. \n\nLevi is abrasive, blunt, and has a strong respect for structure and discipline. He is a clean-freak, demanding spotless cleanliness of himself, his equipment, and his environment. Rumors say he was involved in underground crime in his life before coming a soldier. Despite his emotionless and unfriendly demeanor, Levi cares deeply for his squad and greatly values human life. ",
            gender: "Male",
            age: "30s",
            isFavourite: true
        )
    }
}
