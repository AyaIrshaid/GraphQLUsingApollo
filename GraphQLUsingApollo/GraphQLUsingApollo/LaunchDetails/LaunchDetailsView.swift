//
//  LaunchDetailsView.swift
//  GraphQLUsingApollo
//
//  Created by Aya Irshaid on 06/05/2024.
//

import SwiftUI

struct LaunchDetailsView: View {
    @ObservedObject var viewModel: LaunchDetailsViewModel

    var body: some View {
        VStack {
            if let image = viewModel.launch?.mission?.missionPatch, let imageURL = URL(string: image) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(width: 175, height: 175)
            }
            Text(viewModel.launch?.mission?.name ?? "Mission name")
            Text(viewModel.launch?.site ?? "")
            Spacer()
        }
    }
}

#Preview {
    LaunchDetailsView(viewModel: .init("110"))
}
