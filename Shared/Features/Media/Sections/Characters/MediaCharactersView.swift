//
//  MediaCharactersView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/12/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaCharactersView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if viewModel.media?.characters?.edges?.isEmpty == false {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: MediaCharacterListExpandedView().environmentObject(viewModel)) {
                        Text("Characters")
                            .font(.title)
                            .bold()
                    }.buttonStyle(PlainButtonStyle())

                    let total = viewModel.media?.characters?.pageInfo?.total
                        ?? viewModel.media?.characters?.edges?.count
                        ?? 0

                    Text("\(total) Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                NavigationLink(destination: MediaCharacterListExpandedView().environmentObject(viewModel)) {
                    Text("See All")
                        .font(.headline)
                }
            }

            let edges = viewModel.media?.characters?.edges?.prefix(6).compactMap { $0?.node == nil ? nil : $0 } ?? []

            Divider()

            ForEach(edges, id: \.id) { edge in
                MediaCharacterView(edge: edge)
                Divider()
            }
        }
    }
}

fileprivate struct MediaCharacterListExpandedView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var page = 1

    var body: some View {
        let edges = viewModel.media?.characters?.edges?.compactMap { $0?.node == nil ? nil : $0 } ?? []

        List(Array(edges.enumerated()), id: \.element.id) { (index, edge) in
            ScrollView {
                MediaCharacterView(edge: edge).onAppear {
                    let hasNextPage = viewModel.media?.characters?.pageInfo?.hasNextPage == true

                    if index == edges.count - 1 && hasNextPage {
                        page += 1
                        viewModel.nextCharacterPage(page: page)
                    }
                }
            }
        }.navigationTitle("Characters")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MediaCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCharactersView()
    }
}
