//
//  MediaEditorProgressView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorProgressView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        if let type = viewModel.media?.type {
            // The binding takes a double since `Slider` requires it. It's converted to an `Int` when stored.
            let binding = Binding {
                Double(viewModel.media?.mediaListEntry?.progress ?? 0)
            } set: { progress in
                if viewModel.media?.mediaListEntry == nil {
                    viewModel.media?.mediaListEntry = .init(id: -1, progress: Int(progress))
                } else {
                    viewModel.media?.mediaListEntry?.progress = Int(progress)
                }
            }

            switch type {
                case .anime:
                    MediaEditorProgressAnimeView(progress: binding)
                case .manga:
                    MediaEditorProgressMangaView(progress: binding)
                case .__unknown:
                    EmptyView()
            }
        }
    }
}
