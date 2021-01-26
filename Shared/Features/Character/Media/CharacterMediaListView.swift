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

    var body: some View {
        let total = viewModel.character?.media?.pageInfo?.total
            ?? viewModel.character?.media?.edges?.count
            ?? 0

        if total > 0 {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: CharacterMediaListExpandedView().environmentObject(viewModel)) {
                        Text("Anime & Manga")
                            .font(.title)
                            .bold()
                    }.buttonStyle(PlainButtonStyle())

                    Text("\(total) Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                NavigationLink(destination: CharacterMediaListExpandedView().environmentObject(viewModel)) {
                    Text("See All")
                        .font(.headline)
                }
            }

            Divider()

            ForEach(viewModel.character?.media?.edges?.compactMap(filterEdges).prefix(4) ?? [], id: \.id) { edge in
                CharacterMediaView(edge: edge)
                Divider()
            }
        }
    }

    func filterEdges(edge: CharacterMediaEdge?) -> CharacterMediaEdge? {
        guard let media = edge?.node else {
            return nil
        }

        guard currentUser.users.first?.options?.displayAdultContent == true || media.isAdult == false else {
            return nil
        }

        return edge
    }
}

fileprivate struct CharacterMediaListExpandedView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: CharacterViewModel
    @State private var isDisplayingMediaOnList = false
    @State private var isPresenting = false
    @State private var page = 1

    var body: some View {
        let edges = viewModel.character?.media?.edges?.compactMap(filterEdge) ?? []
        let hasNextPage = viewModel.character?.media?.pageInfo?.hasNextPage == true

        List(Array(edges.enumerated()), id: \.element.id) { (index, edge) in
            ScrollView {
                CharacterMediaView(edge: edge).onAppear {
                    if index == edges.count - 1 && hasNextPage {
                        page += 1
                        viewModel.fetchNextMedia(page: page)
                    }
                }
            }
        }.navigationTitle("Anime & Manga")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            }
        }.sheet(isPresented: $isPresenting) {
            CharacterMediaListExpandedFilterView(isDisplayingMediaOnList: $isDisplayingMediaOnList)
        }
    }

    func filterEdge(edge: CharacterMediaEdge?) -> CharacterMediaEdge? {
        guard let media = edge?.node else {
            return nil
        }

        guard currentUser.users.first?.options?.displayAdultContent == true || media.isAdult == false else {
            return nil
        }

        guard !isDisplayingMediaOnList || media.mediaListEntry != nil else {
            return nil
        }

        return edge
    }
}

fileprivate struct CharacterMediaListExpandedFilterView: View {
    @Binding private(set) var isDisplayingMediaOnList: Bool

    var body: some View {
        NavigationView {
            Form {
                Toggle("On My List", isOn: $isDisplayingMediaOnList)
            }.navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
