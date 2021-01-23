//
//  CharacterMediaListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SwiftUI

typealias CharacterMediaEdge = CharacterQuery.Data.Character.Medium.Edge

struct CharacterMediaListView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: CharacterViewModel
    @State private var page = 1
    @State private var isShowingMediaOnList = false

    var body: some View {
        let edges = viewModel.character?.media?.edges?.compactMap(filter) ?? []
        let hasNextPage = viewModel.character?.media?.pageInfo?.hasNextPage == true
        let total = viewModel.character?.media?.pageInfo?.total
            ?? viewModel.character?.media?.edges?.count
            ?? 0


        if total > 0 {
            HStack {
                VStack(alignment: .leading) {
                    Text("Anime & Manga")
                        .font(.title)
                        .bold()

                    Text("\(total) Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            

            Divider()

            Toggle("On My List", isOn: $isShowingMediaOnList)
            
            Divider()

            LazyVStack {
                ForEach(Array(edges.enumerated()), id: \.element.id) { (index, edge) in
                    CharacterMediaView(edge: edge).onAppear {
                        if index == edges.count - 1 && hasNextPage {
                            page += 1
                            viewModel.fetchNextMedia(page: page)
                        }
                    }

                    Divider()
                }
            }
        }
    }

    func filter(edge: CharacterMediaEdge?) -> CharacterMediaEdge? {
        guard let media = edge?.node else {
            return nil
        }

        // MUST RETURN TRUE ELSE WILL NOT INCLUDE
        guard currentUser.users.first?.options?.displayAdultContent == true || media.isAdult == false else {
            return nil
        }

        guard !isShowingMediaOnList || media.mediaListEntry != nil else {
            return nil
        }

        return edge
    }
}

struct CharacterMediaListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterMediaListView()
    }
}
