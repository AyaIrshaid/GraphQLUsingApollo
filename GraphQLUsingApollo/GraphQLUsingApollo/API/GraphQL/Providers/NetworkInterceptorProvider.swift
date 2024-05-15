//
//  NetworkInterceptorProvider.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 15/05/2024.
//

import Apollo
import ApolloAPI
import Foundation

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation: GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
}
