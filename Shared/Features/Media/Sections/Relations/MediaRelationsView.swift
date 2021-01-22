//
//  MediaRelationsView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/12/21.
//

import SwiftUI

struct MediaRelationsView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                NavigationLink(destination: MediaRelationListExpandedView().environmentObject(viewModel)) {
                    Text("Relations")
                        .font(.title)
                        .bold()
                }.buttonStyle(PlainButtonStyle())

                // Josh: "relations is a fake page object, doesn't actually paginate at all"
                let total = viewModel.media?.relations?.pageInfo?.total
                    ?? viewModel.media?.relations?.edges?.count
                    ?? 0

                Text("\(total) Total")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            NavigationLink(destination: MediaRelationListExpandedView().environmentObject(viewModel)) {
                Text("See All")
                    .font(.headline)
            }
        }

        let edges = viewModel.media?.relations?.edges?.prefix(6).compactMap { $0?.node == nil ? nil : $0 } ?? []

        Divider()

        ForEach(edges, id: \.id) { edge in
            MediaRelationView(edge: edge)
            Divider()
        }
    }
}

fileprivate struct MediaRelationListExpandedView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        let edges = viewModel.media?.relations?.edges?.compactMap { $0?.node == nil ? nil : $0 } ?? []

        List(edges, id: \.id) { edge in
            ScrollView {
                MediaRelationView(edge: edge)
            }
        }.navigationTitle("Relations")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MediaRelationsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRelationsView()
    }
}
