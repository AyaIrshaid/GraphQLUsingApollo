//
//  LaunchDetailsViewModel.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import Apollo
import CodegenConfig
import SwiftUI

class LaunchDetailsViewModel: ObservableObject {
    @Published var launch: LaunchDetailsQuery.Data.Launch?

    init(_ launchID: ID) {
        getLaunchDetails(launchID)
    }

    func getLaunchDetails(_ launchID: ID) {
        GraphQLNetworkingProvider.shared.apolloClient.fetch(query: LaunchDetailsQuery(launchId: launchID)) { [weak self] result in
            switch result {
            case let .success(graphQLResult):
                if let launchConnection = graphQLResult.data?.launch {
                    self?.launch = launchConnection
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
