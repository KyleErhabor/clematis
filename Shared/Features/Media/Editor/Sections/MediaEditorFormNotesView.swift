//
//  MediaEditorFormNotesView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/17/20.
//

import SwiftUI

struct MediaEditorFormNotesView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let textBinding = Binding {
            viewModel.media!.mediaListEntry?.notes ?? ""
        } set: { text in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, notes: text)
            } else {
                viewModel.media!.mediaListEntry!.notes = text
            }
        }

        TextEditor(text: textBinding)
    }
}
