//
//  LaunchListViewModel.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import Apollo
import CodegenConfig
import Foundation

class LaunchListViewModel: ObservableObject {
    @Published var launches = [LaunchListQuery.Data.Launches.Launch?]()
    
    let apolloClient = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)

    init() {

    }

    func getLaunchList() {
        GraphQLNetworkingProvider.shared.apolloClient.fetch(query: LaunchListQuery()) { [weak self] result in
            switch result {
            case let .success(graphQLResult):
                if let launchConnection = graphQLResult.data?.launches {
                    self?.launches = launchConnection.launches.compactMap { $0 }
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
