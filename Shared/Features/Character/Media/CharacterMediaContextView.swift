//
//  CharacterMediaContextView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

/// A view for displaying the `CharacterMediaView`'s controls.
struct CharacterMediaContextView: View {
    /// A binding to present a sheet to edit the anime/manga on the current user's list.
    @Binding var isPresenting: Bool

    /// The anime/manga the character is affiliated with.
    var media: CharacterMediaEdge.Node

    /// The voice actor the character is affiliated with for this anime.
    var staff: CharacterMediaEdge.VoiceActor?

    var body: some View {
        if let staff = staff {
            Menu("Anime/Manga") {
                CharacterMediaContextAnimeMangaView(isPresenting: $isPresenting, media: media)
            }

            Menu("Voice Actor") {
                CharacterMediaContextStaffView(staff: staff)
            }
        } else {
            CharacterMediaContextAnimeMangaView(isPresenting: $isPresenting, media: media)
        }
    }
}

/// A view for displaying the anime/manga part of the context menu from the `CharacterMediaContextView`.
fileprivate struct CharacterMediaContextAnimeMangaView: View {
    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    /// A binding to present a sheet to edit the anime/manga on the current user's list.
    @Binding var isPresenting: Bool

    /// The anime/manga the character is affiliated with.
    var media: CharacterMediaEdge.Node

    var body: some View {
        Button {
            isPresenting = true
        } label: {
            Label("Open List Editor", systemImage: "pencil")
        }

        Button {
            viewModel.toggleFavorite(media: media)
        } label: {
            let isFavorite = media.isFavourite

            Label(isFavorite ? "Unfavorite" : "Favorite", systemImage: isFavorite ? "heart.fill" : "heart")
        }
    }
}

fileprivate struct CharacterMediaContextStaffView: View {
    private(set) var staff: CharacterMediaEdge.VoiceActor

    var body: some View {
        Text("?")
    }
}
