//
//  ALServices+Activity.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 03/06/23.
//

import Foundation

public extension ALServices {
    func getActivities(of user: Int, token: String? = nil) async -> [ActivityUnion]? {
        let activitiesRespone: GraphQLResponse<AniListPageResponse>? = await request(
            GraphQLQuery(query: Queries.activities(user).body),
            token: token
        )
        return activitiesRespone?.data.Page?.activities
    }
    
    func getActivity(id: Int, token: String? = nil) async -> ActivityUnion? {
        let activityResponse: GraphQLResponse<AniListActivityResponse>? = await request(
            GraphQLQuery(query: Queries.activity(id).body),
            token: token
        )
        return activityResponse?.data.Activity
    }
    
    @discardableResult
    func deleteActivity(with id: Int,token: String) async -> GraphQLResponse<AniListDeleteActivityResponse>? {
        let response: GraphQLResponse<AniListDeleteActivityResponse>? = await request(
            GraphQLQuery(query: Queries.deleteActivity(id).body),
            token: token
        )
        return response
    }
    
    @discardableResult
    func toggleSubscription(id: Int, subscribe: Bool, token: String) async -> GraphQLResponse<AniListToggleSubResponse>? {
        let response: GraphQLResponse<AniListToggleSubResponse>? = await request(
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
