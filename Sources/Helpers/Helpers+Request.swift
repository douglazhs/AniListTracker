//
//  Helpers+Request.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

// Helpers+Request
extension Helpers {
    public func request<T: Codable, D: Encodable>(
        _ data: D,
        token: String? = nil
    ) async -> T? {
        guard let url = URL(string: URLs.ALBaseReq.description) else { return nil }
        var request = URLRequest(url: url)
        var headers = [
            "Content-Type":"application/json",
            "Accept":"application/json",
        ]
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.timeoutInterval = TimeInterval(15)
        do {
            request.httpBody = try JSONEncoder().encode(data)
            return try await URLSession.shared.object(from: request)
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
