//
//  MediaPropertyFavoritesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyFavoritesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let favorites = viewModel.media?.favourites, favorites > 0 {
            GroupBox(label: Text("Favorites")) {
                Text("\(favorites.abbreviated)")
            }
        }
    }
}
