//
//  SearchQueryView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/18/21.
//

// SearchSearchView sounds stupid.

import SwiftUI

struct SearchQueryView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    @State private var search = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Search...", text: $search) { _ in
                // Do nothing for "onEditingChanged".
            } onCommit: {
                viewModel.search(for: search)
            }

            if let anime = viewModel.fields?.anime?.media?.compactMap({ $0 }), !anime.isEmpty {
                Text("Anime")
                    .font(.title2)
                    .bold()

                Divider()

                ForEach(anime, id: \.id) { anime in
                    SearchQueryAnimeView(anime: anime)
                    Divider()
                }
            }
        }
    }
}
