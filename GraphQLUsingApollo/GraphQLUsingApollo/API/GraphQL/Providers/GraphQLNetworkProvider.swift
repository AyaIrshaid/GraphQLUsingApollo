//
//  GraphQLNetworkProvider.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import Apollo
import Foundation

public final class GraphQLNetworkingProvider {
    static let shared = GraphQLNetworkingProvider()
    let apolloClient: ApolloClient
    init() {
        apolloClient = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
    }
}
