//
//  AuthorizationInterceptor.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 15/05/2024.
//

import Apollo
import ApolloAPI
import Foundation

class AuthorizationInterceptor: ApolloInterceptor {
    var id: String = ""

    func interceptAsync<Operation>(chain: any Apollo.RequestChain,
                                   request: Apollo.HTTPRequest<Operation>,
                                   response: Apollo.HTTPResponse<Operation>?,
                                   completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, any Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        request.addHeader(name: "Authorization", value: "YUBzdGguY29t")
        chain.proceedAsync(request: request,
                           response: response,
                           interceptor: self,
                           completion: completion)
    }
}
