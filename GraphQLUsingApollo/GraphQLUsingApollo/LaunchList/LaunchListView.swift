//
//  LaunchListView.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import SwiftUI

struct LaunchListView: View {
    @ObservedObject var viewModel: LaunchListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.launches, id: \.?.id) { launch in
                    NavigationLink {
                        if let launchID = launch?.id {
                            LaunchDetailsView(viewModel: .init(launchID))
                        }
                    } label: {
                        Text("\(launch?.mission?.name ?? "l")")
                    }
                }
            }
            .task {
                viewModel.getLaunchList()
            }
            .navigationTitle("Trips")
        }
    }
}
