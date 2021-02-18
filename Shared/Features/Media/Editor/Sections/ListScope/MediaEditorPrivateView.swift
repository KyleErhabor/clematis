//
//  MediaEditorPrivateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorPrivateView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.private ?? false
        } set: { isPrivate in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: -1, private: isPrivate)
            } else {
                viewModel.media?.mediaListEntry?.private = isPrivate
            }
        }

        Toggle("Private", isOn: binding)
    }
}
