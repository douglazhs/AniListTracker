//
//  URLSession+extension.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 23/05/23.
//

import Foundation

// URLSession+extension
extension URLSession {
    /// Object from a specifc request
    /// - Parameter req: Request
    /// - Returns: Dcoded object from request
    func result<T: Codable>(from req: URLRequest) async throws -> T {
        let (data, response) = try await self.data(for: req)
        let httUrlResp = response as? HTTPURLResponse
        guard 200...299 ~= (httUrlResp?.statusCode ?? 0)
        else { throw httUrlResp?.status ?? .noResponse }
        return (
            try JSONDecoder().decode(
                T.self,
                from: data
            )
        )
    }
}
