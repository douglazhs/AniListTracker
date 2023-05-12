//
//  ALServices+Login.swift
//  Orochii
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/23.
//

import Combine
import AuthenticationServices

// ALServices+Login/LogOut
public class ALAccount: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding, ALServices {
    var subscriptions = Set<AnyCancellable>()
    private (set) var accAccess: [String:String] = [:]
    
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
    
    public func logIn() {
        let signInPromise = Future<URL, Error> { completion in
            let apiData = ApiSetup(
                id: 11988,
                secret: "hqZ1CwAKXMqLYXy2n0cvP1Why8X5jlAc0V56PhuJ",
                name: "Orochii",
                redirectURL: URL(string: "orochiapp")!
            )
            let authUrl = self.authUrlBuilder(clientID: apiData.id, domain: "anilist.co")
            
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
