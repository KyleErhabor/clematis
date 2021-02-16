//
//  MediaEditorRepeatView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorRepeatView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.repeat ?? 0
        } set: { repeats in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: viewModel.id, repeat: repeats)
            } else {
                viewModel.media?.mediaListEntry?.repeat = repeats
            }
        }

        let title = binding.wrappedValue == 0
            ? "Repeats"
            : "Repeats: \(binding.wrappedValue)"


        Stepper("\(title)", value: binding, in: 0...Int.max)
    }
}
