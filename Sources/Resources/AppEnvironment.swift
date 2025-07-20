//
//  AppEnvironment.swift
//  AniListService
//
//  Created by Douglas Henrique de Souza Pereira on 19/07/25.
//

import Foundation

public enum AppEnvironment {
    enum Keys {
        static let appID = "APP_ID"
        static let appName = "APP_NAME"
        static let apiSecretKey = "API_SECRET_KEY"
        static let apiRedirectURL = "API_REDIRECT_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        
        return dict
    }()
    
    
    static let appID: Int = {
        guard let appIDString = AppEnvironment.infoDictionary[Keys.appID] as? String,
        let appID = Int(appIDString) else {
            fatalError("App ID not found in Info.plist")
        }
        
        return appID
    }()
    
    static let appName: String = {
        guard let appNameString = AppEnvironment.infoDictionary[Keys.appName] as? String else {
            fatalError("App Name not found in Info.plist")
        }
        
        return appNameString
    }()
    
    static let apiSecretKey: String = {
        guard let apiSecretKeyString = AppEnvironment.infoDictionary[Keys.apiSecretKey] as? String else {
            fatalError("API Secret Key not found in Info.plist")
        }
        
        return apiSecretKeyString
    }()
    
    static let apiRedirectURL: String = {
        guard let apiRedirectURLString = AppEnvironment.infoDictionary[Keys.apiRedirectURL] as? String else {
            fatalError("API Redirect URL not found in Info.plist")
        }
        
        return apiRedirectURLString
    }()
}
