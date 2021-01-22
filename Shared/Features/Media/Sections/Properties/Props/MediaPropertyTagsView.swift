//
//  MediaPropertyTagsView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyTagsView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var isShowingSpoilers = false

    var body: some View {
        let tags = getTags()

        if tags.isEmpty != true {
            MediaPropertyView("Tags") {
                Text("\(tags.count)")
            } expanded: {
                VStack {
                    if containsSpoilers() {
                        HStack {
                            Button(isShowingSpoilers ? "Hide Spoilers" : "Show Spoilers") {
                                isShowingSpoilers.toggle()
                            }

                            Spacer()
                        }
                    }

                    ForEach(tags, id: \.id) { tag in
                        if tag.isMediaSpoiler == true {
                            MediaPropertyView("\(tag.rank ?? 0)") {
                                Text(tag.name).foregroundColor(.red)
                            } expanded: {
                                MediaPropertyTagExpandedView(tag: tag)
                            }
                        } else {
                            MediaPropertyView("\(tag.rank ?? 0)") {
                                Text(tag.name)
                            } expanded: {
                                MediaPropertyTagExpandedView(tag: tag)
                            }
                        }
                    }
                }
            }
        }
    }

    func getTags() -> [MediaQuery.Data.Medium.Tag] {
        var tags = viewModel.media?.tags?.compactMap({ $0 }) ?? []

        if !currentUser.users.isEmpty && currentUser.users[0].options?.displayAdultContent != true {
            // Check if it's false in case $0 is somehow null (unlikely).
            tags = tags.filter { $0.isAdult == false }
        }

        if !isShowingSpoilers {
            tags = tags.filter { $0.isMediaSpoiler == false }
        }

        return tags
    }

    func containsSpoilers() -> Bool {
        var tags = viewModel.media?.tags ?? []

        if !currentUser.users.isEmpty && currentUser.users[0].options?.displayAdultContent != true {
            // Check if it's false in case $0 is somehow null (unlikely).
            tags = tags.filter { $0?.isAdult == false }
        }

        return tags.contains { $0?.isMediaSpoiler == true }
    }
}

fileprivate struct MediaPropertyTagExpandedView: View {
    private(set) var tag: MediaQuery.Data.Medium.Tag

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if let description = tag.description {
                    Text(description)
                        .padding(.bottom)
                }

                // TODO: Point this to the browse view.
                NavigationLink(destination: EmptyView()) {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }

            Spacer()
        }
    }
}

struct MediaPropertyTagsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyTagsView()
    }
}
