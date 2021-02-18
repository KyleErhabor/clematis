//
//  UserFavoritesAnimeListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserFavoritesAnimeListView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let animeList = viewModel.user?.favourites?.anime?.nodes?.compactMap { $0 } ?? []

        if !animeList.isEmpty {
            let total = viewModel.user?.favourites?.anime?.pageInfo?.total
                ?? viewModel.user?.favourites?.anime?.nodes?.count
                ?? 0

            GroupBox(label: VStack(alignment: .leading) {
                Text("Anime")

                Text("\(total) Total")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
            }) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(animeList, id: \.id) { anime in
                            NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: anime.id))) {
                                UserFavoriteImageView(image: URL(string: anime.coverImage?.extraLarge ?? "")) {
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
    }
}
