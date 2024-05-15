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

    private(set) lazy var apolloClient: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        return ApolloClient(networkTransport: transport, store: store)
    }()
}
