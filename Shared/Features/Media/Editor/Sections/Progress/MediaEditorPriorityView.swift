//
//  MediaEditorPriorityView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorPriorityView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.priority ?? 0
        } set: { priority in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: -1, priority: priority)
            } else {
                viewModel.media?.mediaListEntry?.priority = priority
            }
        }

        let title = binding.wrappedValue == 0
            ? "Priority"
            : "Priority: \(binding.wrappedValue)"

        Stepper("\(title)", value: binding, in: 0...Int.max)
    }
}
