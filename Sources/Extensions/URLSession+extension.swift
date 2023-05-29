//
//  URLSession+extension.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

// URLSession+extension
extension URLSession {
    /// Gets the data returned by the request
    /// - Parameter request: Built request
    /// - Returns: Data from request
    func data(for request: URLRequest) async throws -> Data {
        let (data, _) = try await self.data(for: request, delegate: nil)
        return data
    }
    
    /// Object from a specifc request
    /// - Parameter req: Request
    /// - Returns: Dcoded object from request
    func object<T: Codable>(from req: URLRequest) async throws -> T {
        let data = try await self.data(for: req)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
