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
    @Published var showAlert = false

    private let launchID: ID

    var alertMessage = ""

    init(_ launchID: ID) {
        self.launchID = launchID
    }

    func getLaunchDetails() {
        GraphQLNetworkingProvider.shared.apolloClient.fetch(query: LaunchDetailsQuery(launchId: launchID), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
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

    func bookOrCancel() {
        guard let launch = launch else {
            return
        }

        switch launch.isBooked {
        case true: cancelTrip(with: launch.id)
        default: bookTrip(with: launch.id)
        }
    }

    func resetAlert() {
        alertMessage = ""
    }
}

private extension LaunchDetailsViewModel {
    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }

    func bookTrip(with id: String) {
        GraphQLNetworkingProvider.shared.apolloClient.perform(mutation: BookTripMutation(id: id)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success(graphQLResult):
                if let bookingResult = graphQLResult.data?.bookTrips {
                    if bookingResult.success {
                        self.showAlert(message: bookingResult.message ?? "Trip booked successfully")
                        self.getLaunchDetails()
                    } else {
                        print("Could not book trip: \(String(describing: bookingResult.message))")
                    }
                }
                if let errors = graphQLResult.errors {
                    print("Could not book trip: \(errors)")
                }
            case let .failure(error):
                print("Could not book trip: \(error)")
            }
        }
    }

    func cancelTrip(with id: String) {
        GraphQLNetworkingProvider.shared.apolloClient.perform(mutation: CancelTripMutation(launchId: id)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success(graphQLResult):
                if let cancelResult = graphQLResult.data?.cancelTrip {
                    if cancelResult.success {
                        self.showAlert(message: cancelResult.message ?? "Trip booked successfully")
                        self.getLaunchDetails()
                    } else {
                        print("Could not cancel trip: \(String(describing: cancelResult.message))")
                    }
                }
                if let errors = graphQLResult.errors {
                    print("Could not cancel trip: \(String(describing: errors))")
                }
            case let .failure(error):
                print("Could not cancel trip: \(String(describing: error))")
            }
        }
    }
}
