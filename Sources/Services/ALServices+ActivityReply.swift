//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 03/06/23.
//

import Foundation

public extension ALServices {
    @discardableResult
    func createReply(activiyId: Int, text: String, token: String) async throws -> AniListSaveReplyResponse? {
        let response: GraphQLResponse<AniListSaveReplyResponse>? = try await request(
            GraphQLVariableQuery(
                query: Queries.createReply.body,
                variables: ALCreateReplyVars(
                    activityId: activiyId,
                    text: text
                )
            ),
            token: token
        )
        return response?.data
    }
    
    @discardableResult
    func updateReply(id: Int, text: String, token: String) async throws -> AniListSaveReplyResponse? {
        let response: GraphQLResponse<AniListSaveReplyResponse>? = try await request(
            GraphQLVariableQuery(
                query: Queries.updateReply.body,
                variables: ALUpdateReplyVars(
                    id: id,
                    text: text
                )
            ),
            token: token
        )
        return response?.data
    }
    
    @discardableResult
    func deleteReply(id: Int, token: String) async throws -> AniListDeleteReplyResponse? {
        let response: GraphQLResponse<AniListDeleteReplyResponse>? = try await request(
            GraphQLQuery(query: Queries.deleteReply(id).body),
            token: token
        )
        return response?.data
    }
}
