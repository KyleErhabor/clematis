//
//  CharacterMediaListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SwiftUI

/// A view for displaying a list of anime/manga associated with a character.
struct CharacterMediaListView: View {
    /// The global environment object for users.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    var body: some View {
        let edges = viewModel.character?.media?.edges?.compactMap(filterEdges).prefix(4) ?? []

        if edges.count > 0 {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    NavigationLink(destination: CharacterMediaListExpandedView().environmentObject(viewModel)) {
                        Text("Anime & Manga")
                            .font(.title2)
                            .bold()
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()

                    NavigationLink(destination: CharacterMediaListExpandedView().environmentObject(viewModel)) {
                        Text("See All")
                    }
                }

                ForEach(edges, id: \.id) { edge in
                    CharacterMediaView(edge: edge)
                    Divider()
                }
            }
        }
    }

    /// Filters a media edge.
    ///
    /// The filter verifies if the edge is not `nil` and, if the user hasn't opted in to displaying adult content, if the anime/manga isn't for adults only.
    /// - Parameter edge: The edge containing the anime/manga.
    /// - Returns: The edge, if it passes the filter.
    func filterEdges(edge: CharacterMediaEdge?) -> CharacterMediaEdge? {
        guard let media = edge?.node else {
            return nil
        }

        guard userStore.users.first?.options?.displayAdultContent == true || media.isAdult == false else {
            return nil
        }

        return edge
    }
}
