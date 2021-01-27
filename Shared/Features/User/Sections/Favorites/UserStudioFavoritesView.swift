//
//  UserStudioFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/27/21.
//

import SwiftUI

struct UserStudioFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let studios = viewModel.user?.favourites?.studios?.nodes?.compactMap { $0 } ?? []

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

struct UserStudioFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        UserStudioFavoritesView()
    }
}
