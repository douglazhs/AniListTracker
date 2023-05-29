//
//  Page.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 28/05/23.
//

import Foundation

/// Page result
public struct Page: Codable {
    var media: [Media]?
    var followers: [User]?
    var following: [User]?
}


