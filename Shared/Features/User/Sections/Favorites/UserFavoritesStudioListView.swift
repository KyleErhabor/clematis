//
//  UserFavoritesStudioListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/27/21.
//

import SwiftUI

struct UserFavoritesStudioListView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let studios = viewModel.user?.favourites?.studios?.nodes?.compactMap { $0 } ?? []

        if !studios.isEmpty {
            let total = viewModel.user?.favourites?.studios?.pageInfo?.total
                ?? viewModel.user?.favourites?.studios?.nodes?.count
                ?? 0

            GroupBox(label: VStack(alignment: .leading) {
                Text("Studios")
                
                Text("\(total) Total")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
            }) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(studios, id: \.id) { studio in
                            NavigationLink(destination: StudioView()) {
                                Text("\(studio.name)")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct UserStudioFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        UserFavoritesStudioListView()
    }
}
