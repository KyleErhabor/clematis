//
//  MediaSummaryPropertyFavoritesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyFavoritesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let favorites = viewModel.media?.favourites, favorites > 0 {
            MediaSummaryPropertyView(title: "Favorites", content: favorites.abbreviated)
        }
    }
}

struct MediaSummaryPropertyFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyFavoritesView()
    }
}
