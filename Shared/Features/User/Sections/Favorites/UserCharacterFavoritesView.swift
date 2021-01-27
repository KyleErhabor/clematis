//
//  UserCharacterFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserCharacterFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let characters = viewModel.user?.favourites?.characters?.nodes?.compactMap { $0 } ?? []

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(characters, id: \.id) { character in
                    NavigationLink(destination: CharacterView(viewModel: CharacterViewModel(id: character.id))) {
                        UserFavoriteView(
                            title: character.name?.full ?? "",
                            image: URL(string: character.image?.large ?? "")
                        ) {
                            Color.accentColor
                        }
                    }
                }
            }
        }.frame(height: 120)
    }
}
