//
//  UserAnimeFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserAnimeFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let animeList = viewModel.user?.favourites?.anime?.nodes?.compactMap { $0 } ?? []

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(animeList, id: \.id) { anime in
                    NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: anime.id))) {
                        UserFavoriteView(
                            title: anime.title?.userPreferred ?? "",
                            image: URL(string: anime.coverImage?.extraLarge ?? "")
                        ) {
                            if let hex = anime.coverImage?.color,
                               let color = Int("\(hex)", radix: 16) {
                                Color(hex: color)
                            } else {
                                Color.accentColor
                            }
                        }
                    }
                }
            }
        }.frame(height: 120)
    }
}
