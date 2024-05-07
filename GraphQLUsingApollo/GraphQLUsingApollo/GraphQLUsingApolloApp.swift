//
//  GraphQLUsingApolloApp.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import SwiftUI

@main
struct GraphQLUsingApolloApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchListView(viewModel: .init())
        }
    }
}
