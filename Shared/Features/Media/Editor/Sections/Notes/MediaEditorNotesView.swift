//
//  MediaEditorNotesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorNotesView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.notes ?? ""
        } set: { text in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: -1, notes: text)
            } else {
                viewModel.media?.mediaListEntry?.notes = text
            }
        }

        TextEditor(text: binding)
    }
}
