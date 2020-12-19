//
//  MediaEditorFormListSettingsView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/17/20.
//

import SwiftUI

struct MediaEditorFormListSettingsView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let privateBinding = Binding {
            viewModel.media!.mediaListEntry?.private ?? false
        } set: { isPrivate in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, private: isPrivate)
            } else {
                viewModel.media!.mediaListEntry!.private = isPrivate
            }
        }

        let hiddenStatusBinding = Binding {
            viewModel.media!.mediaListEntry?.hiddenFromStatusLists ?? false
        } set: { isHidden in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, hiddenFromStatusLists: isHidden)
            } else {
                viewModel.media!.mediaListEntry!.hiddenFromStatusLists = isHidden
            }
        }

        Toggle("Private", isOn: privateBinding)
            .help("Select to hide this entry from your lists (only you will be able to view it).")

        Toggle("Hidden From Status Lists", isOn: hiddenStatusBinding)
            .help("Select to hide this entry from all but your custom lists.")
    }
}
