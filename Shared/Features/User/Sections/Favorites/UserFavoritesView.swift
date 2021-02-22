//
//  UserFavoritesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        HStack {
            Text("Favorites")
                .bold()
                .font(.title)

            Spacer()
        }

        // FIXME: Some users may have duplicate favorites (e.g. https://anilist.co/user/Nunmuch/ ).
        UserFavoritesAnimeListView()
        UserFavoritesMangaListView()
        UserFavoritesCharacterListView()
        UserFavoritesStaffListView()
        UserFavoritesStudioListView()
    }
}

struct UserFavoriteImageView<Placeholder: View>: View {
    private let image: URL?
    private let placeholder: Placeholder

    var body: some View {
        WebImage(url: image)
            .resizable()
            .placeholder { placeholder }
            .scaledToFill()
            .frame(width: 80)
            .clipped()
            .cornerRadius(4)
    }

    init(image: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.image = image
        self.placeholder = placeholder()
    }
}

struct UserFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        UserFavoritesView()
    }
}
