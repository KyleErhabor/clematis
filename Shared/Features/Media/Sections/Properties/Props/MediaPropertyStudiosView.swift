//
//  MediaPropertyStudiosView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/19/21.
//

import SwiftUI

struct MediaPropertyStudiosView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        // studios is not truly paginated.
        if let studios = viewModel.media?.studios?.edges?.compactMap({ $0?.node == nil ? nil : $0 }),
           !studios.isEmpty {
            MediaPropertyView("Studios") {
                Text("\(studios.count)")
            } expanded: {
                VStack {
                    ForEach(studios.filter { $0.isMain }, id: \.id) { studio in
                        MediaPropertyStudioView(studio: studio.node!)
                    }

                    let secondaryStudios = studios.filter { !$0.isMain }

                    if secondaryStudios.count != 0 {
                        MediaPropertyView("Producers") {
                            Text("\(secondaryStudios.count)")
                        } expanded: {
                            VStack {
                                ForEach(secondaryStudios, id: \.id) { producer in
                                    MediaPropertyStudioView(studio: producer.node!)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

fileprivate struct MediaPropertyStudioView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    private(set) var studio: MediaQuery.Data.Medium.Studio.Edge.Node

    var body: some View {
        MediaPropertyView(studio.name) {
            NavigationLink("Go", destination: EmptyView())
        }.contextMenu {
            Button {
                viewModel.toggleFavorite(id: studio.id, for: .studio)
            } label: {
                let favorite = studio.isFavourite

                Label(favorite ? "Remove Favorite" : "Add Favorite", systemImage: favorite ? "heart.fill" : "heart")
            }
        }
    }
}

struct MediaPropertyStudiosView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyStudiosView()
    }
}
