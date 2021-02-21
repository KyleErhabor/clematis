//
//  CharacterMediaListExpandedView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/14/21.
//

import SwiftUI

/// A view for displaying an expanded `CharacterMediaListView`, showing all anime/manga and featuring pagination support.
struct CharacterMediaListExpandedView: View {
    /// The global environment object for user accounts.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    /// A state indicating whether to present the filter sheet or not.
    @State private var isPresenting = false

    var body: some View {
        let edges = viewModel.character?.media?.edges?.compactMap(filterEdges) ?? []

        List {
            ForEach(edges, id: \.id) { edge in
                ScrollView {
                    CharacterMediaView(edge: edge)
                }
            }

            if viewModel.character?.media?.pageInfo?.hasNextPage == true {
                ProgressView().onAppear {
                    viewModel.nextMedia()
                }
            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Anime & Manga")
                        .font(.headline)

                    Text("\(viewModel.character?.media?.pageInfo?.total ?? edges.count) Total")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.secondary)
                }
            }

            ToolbarItem(placement: .confirmationAction) {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            }
        }.sheet(isPresented: $isPresenting) {
            viewModel.load()
        } content: {
            CharacterMediaListExpandedFilterView()
                .environmentObject(viewModel)
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

struct CharacterMediaListExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterMediaListExpandedView()
    }
}
