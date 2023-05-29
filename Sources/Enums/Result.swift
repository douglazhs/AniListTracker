//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 24/05/23.
//

import Foundation

/// Login result
public enum Result {
    /// Return the token and expiration date
    case success([String:String])
    /// Return the error of the login
    case fail(Error)
}
