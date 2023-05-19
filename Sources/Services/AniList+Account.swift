//
//  AniList+Account.swift
//  Orochii
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/23.
//

import Combine
import AuthenticationServices

/// AniList+Account
public class AniList: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding, ALServices {
    var subscriptions = Set<AnyCancellable>()
    private (set) var accAccess: [String:String] = [:]
    
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
    
    public func logIn() {
        let signInPromise = Future<URL, Error> { completion in
            do {
                let apiData = try ApiSetup.load()
                let authUrl = self.authUrlBuilder(
                    clientID: apiData.id,
                    domain: "anilist.co"
                )
                let authSession  = ASWebAuthenticationSession(
                    url: authUrl,
                    callbackURLScheme: apiData.redirectURL.absoluteString
                ) { (url, error) in
                    if let error = error {
                        completion(.failure(error))
                    } else if let url = url {
                        completion(.success(url))
                    }
                }
                authSession.presentationContextProvider = self
                authSession.prefersEphemeralWebBrowserSession = true
                authSession.start()
            } catch { print(error.localizedDescription) }
        }
        signInPromise.sink { (completion) in
            switch completion {
            case .failure: break
            default: break
            }
        } receiveValue: { (url) in
            self.accAccess = self.processResponseURL(url: url)
        }
        .store(in: &subscriptions)
    }
    
    public func logOut() { }
}
