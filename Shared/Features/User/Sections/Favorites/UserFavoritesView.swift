//
//  UserFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let anime = viewModel.user?.favourites?.anime?.pageInfo?.total
            ?? viewModel.user?.favourites?.anime?.nodes?.count
            ?? 0

        let manga = viewModel.user?.favourites?.manga?.pageInfo?.total
            ?? viewModel.user?.favourites?.manga?.nodes?.count
            ?? 0

        let characters = viewModel.user?.favourites?.characters?.pageInfo?.total
            ?? viewModel.user?.favourites?.characters?.nodes?.count
            ?? 0

        let staff = viewModel.user?.favourites?.staff?.pageInfo?.total
            ?? viewModel.user?.favourites?.staff?.nodes?.count
            ?? 0

        let studios = viewModel.user?.favourites?.studios?.pageInfo?.total
            ?? viewModel.user?.favourites?.studios?.nodes?.count
            ?? 0

        HStack {
            Text("Favorites")
                .font(.title)
                .bold()

            Spacer()
        }

        GroupBox(label: VStack(alignment: .leading) {
            Text("Anime")
            Text("\(anime) Total")
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }) {
            UserAnimeFavoritesView()
        }

        GroupBox(label: VStack(alignment: .leading) {
            Text("Manga")
            Text("\(manga) Total")
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }) {
            UserMangaFavoritesView()
        }

        GroupBox(label: VStack(alignment: .leading) {
            Text("Characters")
            Text("\(characters) Total")
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }) {
            UserCharacterFavoritesView()
        }

        GroupBox(label: VStack(alignment: .leading) {
            Text("Staff")
            Text("\(staff) Total")
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }) {
            UserStaffFavoritesView()
        }

        GroupBox(label: VStack(alignment: .leading) {
            Text("Studios")
            Text("\(studios) Total")
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }) {
            UserStudioFavoritesView()
        }
    }
}

struct UserFavoriteView<Placeholder: View>: View {
    private let title: String
    private let image: URL?
    private let isEditing: Bool
    private let placeholder: Placeholder

    var body: some View {
        if isEditing {
            Text("\(title)")
                .font(.headline)
        } else {
            WebImage(url: image)
                .resizable()
                .placeholder { placeholder }
                .scaledToFill()
                .frame(width: 80)
                .clipped()
                .cornerRadius(4)
        }
    }

    init(title: String, image: URL?, isEditing: Bool = false, @ViewBuilder placeholder: () -> Placeholder) {
        self.title = title
        self.image = image
        self.isEditing = isEditing
        self.placeholder = placeholder()
    }
}

struct UserFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        UserFavoritesView()
    }
}
