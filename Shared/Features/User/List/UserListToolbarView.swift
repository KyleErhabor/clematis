//
//  UserListToolbarView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/20/21.
//

import SwiftUI

struct UserListToolbarView: View {
    @EnvironmentObject private var viewModel: UserListViewModel

    var body: some View {
        Menu {
            // In the future, it would look better to display a picker in the list navigation center edge (like Mail
            // when you press the search bar).
            Button {
                viewModel.type = .anime
                viewModel.load()
            } label: {
                Label("Anime", systemImage: "tv")
            }
            
            Button {
                viewModel.type = .manga
                viewModel.load()
            } label: {
                Label("Manga", systemImage: "book")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}

struct UserListToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        UserListToolbarView()
            .environmentObject(UserListViewModel(id: 5136358))
    }
}
