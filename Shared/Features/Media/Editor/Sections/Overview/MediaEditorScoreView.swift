//
//  MediaEditorScoreView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScoreView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var userStore: CurrentUserStore

    var body: some View {
        if let scoreFormat = userStore.users.first?.mediaListOptions?.scoreFormat {
            let binding = Binding {
                // `Stepper` does not allow the value to be `nil`.
                viewModel.media?.mediaListEntry?.score ?? 0
            } set: { score in
                if viewModel.media?.mediaListEntry == nil {
                    viewModel.media?.mediaListEntry = .init(id: viewModel.id, score: score)
                } else {
                    viewModel.media?.mediaListEntry?.score = score
                }
            }

            switch scoreFormat {
                case .point_100:
                    MediaEditorScore100View(score: binding)
                case .point_10Decimal:
                    MediaEditorScore10DecimalView(score: binding)
                case .point_10:
                    MediaEditorScore10View(score: binding)
                case .point_5:
                    MediaEditorScore5View(score: binding)
                case .point_3:
                    MediaEditorScore3View(score: binding)
                case .__unknown:
                    EmptyView()
            }
        }
    }
}
