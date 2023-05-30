//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/23.
//

import Foundation
import Combine

public class AniList: NSObject, ALServices {
    var subscriptions = Set<AnyCancellable>()
}

public extension ALServices {
    func logIn(response: @escaping (Result) -> Void) { }
}
