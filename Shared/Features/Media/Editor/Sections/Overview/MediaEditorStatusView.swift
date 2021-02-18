//
//  MediaEditorStatusView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorStatusView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    
    var body: some View {
        let binding = Binding {
            viewModel.media?.mediaListEntry?.status
        } set: { status in
            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: -1, status: status)
            } else {
                viewModel.media?.mediaListEntry?.status = status
            }

            if let status = status {
                reaction(status: status)
            }
        }

        Picker("Status", selection: binding) {
            ForEach(MediaListStatus.allCases, id: \.rawValue) { status in
                if let type = viewModel.media?.type {
                    Text("\(AniList.statusString(status: status, type: type))")
                        .tag(status as MediaListStatus?)
                } else {
                    Text("\(status.rawValue.capitalized)")
                        .tag(status as MediaListStatus?)
                }
            }
        }
    }

    func reaction(status: MediaListStatus) {
        if case .completed = status,
           let type = viewModel.media?.type {
            switch type {
                case .anime:
                    viewModel.media?.mediaListEntry?.progress = viewModel.media?.episodes
                default:
                    viewModel.media?.mediaListEntry?.progress = viewModel.media?.chapters
                    viewModel.media?.mediaListEntry?.progressVolumes = viewModel.media?.volumes
            }
        }
    }
}
