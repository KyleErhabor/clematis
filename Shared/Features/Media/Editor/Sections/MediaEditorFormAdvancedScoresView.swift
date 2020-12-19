//
//  MediaEditorFormAdvancedScoresView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormAdvancedScoresView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        if viewModel.media!.type == .anime {
            let scoreSections = currentUser.users[0].mediaListOptions!.animeList!.advancedScoring!.compactMap { $0 }

            ForEach(scoreSections, id: \.self) { name in
                MediaEditorFormAdvancedScoresRowView(name: name)
            }
        }

        if viewModel.media!.type == .manga {
            let scoreSections = currentUser.users[0].mediaListOptions!.mangaList!.advancedScoring!.compactMap { $0 }

            ForEach(scoreSections, id: \.self) { name in
                MediaEditorFormAdvancedScoresRowView(name: name)
            }
        }
    }
}

fileprivate struct MediaEditorFormAdvancedScoresRowView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    
    private(set) var name: String

    var body: some View {
        let isPoint100 = currentUser.users[0].mediaListOptions!.scoreFormat! == .point_100

        let scoreBinding = Binding {
            (viewModel.media!.mediaListEntry?.advancedScores?[name] as? Double) ?? 0
        } set: { score in
            let score = isPoint100 ? floor(score) : round(score * 10) / 10

            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, advancedScores: [name: score])
            } else {
                if viewModel.media!.mediaListEntry!.advancedScores == nil {
                    viewModel.media!.mediaListEntry!.advancedScores = [name: score]
                } else {
                    viewModel.media!.mediaListEntry!.advancedScores![name] = score
                }
            }
        }

        let scoreLabel = isPoint100
            ? "\(Int(scoreBinding.wrappedValue))"
            : String(format: "%.1f", scoreBinding.wrappedValue)

        Stepper("\(name): \(scoreBinding.wrappedValue == 0 ? "None" : scoreLabel)",
                value: scoreBinding,
                in: 0...(isPoint100 ? 100 : 10),
                step: isPoint100 ? 1 : 0.1)

        Slider(value: scoreBinding, in: 0...(isPoint100 ? 100 : 10))
    }
}
