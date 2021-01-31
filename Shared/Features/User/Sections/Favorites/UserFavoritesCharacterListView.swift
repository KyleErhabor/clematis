//
//  UserFavoritesCharacterListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserFavoritesCharacterListView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let characters = viewModel.user?.favourites?.characters?.nodes?.compactMap { $0 } ?? []

        if !characters.isEmpty {
            let total = viewModel.user?.favourites?.characters?.pageInfo?.total
                ?? viewModel.user?.favourites?.characters?.nodes?.count
                ?? 0

            GroupBox(label: VStack(alignment: .leading) {
                Text("Characters")
                
                Text("\(total) Total")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
            }) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(characters, id: \.id) { character in
                            let id = character.id // To avoid reaching the 120 character limit

                            NavigationLink(destination: CharacterView(viewModel: CharacterViewModel(id: id))) {
                                UserFavoriteImageView(image: URL(string: character.image?.large ?? "")) {
                                    Color.accentColor
                                }
                            }
                        }
                    }
                }.frame(height: 120)
            }
        }
    }
}
