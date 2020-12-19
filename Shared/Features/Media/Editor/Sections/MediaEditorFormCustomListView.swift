//
//  MediaEditorFormCustomListView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormCustomListView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        if viewModel.media!.type == .anime {
            let customLists = currentUser.users[0].mediaListOptions!.animeList!.customLists!.compactMap { $0 }

            ForEach(customLists, id: \.self) { name in
                MediaEditorFormCustomListRowView(name: name)
            }
        }

        if viewModel.media!.type == .manga {
            let customLists = currentUser.users[0].mediaListOptions!.mangaList!.customLists!.compactMap { $0 }

            ForEach(customLists, id: \.self) { name in
                MediaEditorFormCustomListRowView(name: name)
            }
        }
    }
}

fileprivate struct MediaEditorFormCustomListRowView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    private(set) var name: String

    var body: some View {
        let listBinding = Binding {
            (viewModel.media!.mediaListEntry?.customLists?[name] as? Bool) ?? false
        } set: { enabled in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, customLists: [name: enabled])
            } else {
                if viewModel.media!.mediaListEntry!.customLists == nil {
                    viewModel.media!.mediaListEntry!.customLists = [name: enabled]
                } else {
                    viewModel.media!.mediaListEntry!.customLists![name] = enabled
                }
            }
        }

        Toggle(name, isOn: listBinding)
    }
}
