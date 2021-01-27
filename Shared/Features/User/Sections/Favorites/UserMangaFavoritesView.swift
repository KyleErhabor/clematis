//
//  UserMangaFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserMangaFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let mangaList = viewModel.user?.favourites?.manga?.nodes?.compactMap { $0 } ?? []

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(mangaList, id: \.id) { manga in
                    NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: manga.id))) {
                        UserFavoriteView(
                            title: manga.title?.userPreferred ?? "",
                            image: URL(string: manga.coverImage?.extraLarge ?? "")
                        ) {
                            if let hex = manga.coverImage?.color,
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
