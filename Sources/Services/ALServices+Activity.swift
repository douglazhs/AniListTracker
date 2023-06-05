//
//  ALServices+Activity.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 03/06/23.
//

import Foundation

public extension ALServices {
    func getActivities(of user: Int, token: String? = nil) async throws -> [ActivityUnion]? {
        let activitiesRespone: GraphQLResponse<AniListPageResponse>? = try await request(
            GraphQLQuery(query: Queries.activities(user).body),
            token: token
        )
        return activitiesRespone?.data.Page?.activities
    }
    
    func getActivity(id: Int, token: String? = nil) async throws -> ActivityUnion? {
        let activityResponse: GraphQLResponse<AniListActivityResponse>? = try await request(
            GraphQLQuery(query: Queries.activity(id).body),
            token: token
        )
        return activityResponse?.data.Activity
    }
    
    @discardableResult
    func deleteActivity(with id: Int,token: String) async throws -> GraphQLResponse<AniListDeleteActivityResponse>? {
        let response: GraphQLResponse<AniListDeleteActivityResponse>? = try await request(
            GraphQLQuery(query: Queries.deleteActivity(id).body),
            token: token
        )
        return response
    }
    
    @discardableResult
    func toggleSubscription(id: Int, subscribe: Bool, token: String) async throws -> GraphQLResponse<AniListToggleSubResponse>? {
        let response: GraphQLResponse<AniListToggleSubResponse>? = try await request(
            GraphQLVariableQuery(
                query: Queries.toggleSubscribe.body,
                variables: ALToggleSubVars(
                    activityId: id,
                    subscribe: subscribe
                )
            ),
            token: token
        )
        return response
    }
}
