//
//  AniList+Account.swift
//  Orochii
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/23.
//

import Combine
import AuthenticationServices

/// AniList+Account
public extension AniList {
    func logIn(response: @escaping (LoginResult) -> Void) {
        let signInPromise = Future<URL, Error> { completion in
            do {
                let apiData = try ApiSetup.load()
                let authUrl = self.authUrlBuilder(
                    clientID: apiData.id,
                    domain: "anilist.co"
                )
                let authSession  = ASWebAuthenticationSession(
                    url: authUrl,
                    callbackURLScheme: apiData.redirectURL.scheme
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
            } catch {
                completion(.failure(error))
            }
        }
        signInPromise.sink { (completion) in
            switch completion {
            case .failure(let error): response(.fail(error))
            default: break
            }
        } receiveValue: { (url) in
            response(.success(self.getToken(from: url)))
        }.store(in: &subscriptions)
    }
}

//AniList+WebAuthentication
extension AniList: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(
        for session: ASWebAuthenticationSession
    ) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}
