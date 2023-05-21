//
//  ALServices.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/23.
//

import Combine

/// All AniList services in the app
public protocol ALServices: Helpers {
    /// SignIn AniList account
    func logIn()
    
    /// SignOut AniList account
    func logOut()
    
    /// Update manga status
    func updateManga()
}

/// ALServices+Default Implementation
public extension ALServices {
    func login() { }
    func logout() { }
    func updateManga() { }
}
