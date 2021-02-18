//
//  MediaEditorHiddenFromStatusListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorHiddenFromStatusListView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.hiddenFromStatusLists ?? false
        } set: { bool in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: -1, hiddenFromStatusLists: bool)
            } else {
                viewModel.media?.mediaListEntry?.hiddenFromStatusLists = bool
            }
        }

        Toggle("Hidden From Status List", isOn: binding)
    }
}
