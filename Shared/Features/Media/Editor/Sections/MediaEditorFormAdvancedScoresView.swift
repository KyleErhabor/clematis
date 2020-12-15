//
//  MediaEditorFormAdvancedScoresView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormAdvancedScoresView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var advancedScores: [Double]

    private(set) var media: MediaEditorQuery.Data.Medium

    var body: some View {
        if media.type == .anime {
            let scoring = currentUser.user!.mediaListOptions!.animeList!.advancedScoring!.compactMap { $0 }

            ForEach(scoring.indices, id: \.self) { index in
                MediaEditorFormAdvancedScoresRowView(
                    advancedScores: $advancedScores,
                    name: scoring[index],
                    index: index
                )
            }
        } else {
            let scoring = currentUser.user!.mediaListOptions!.mangaList!.advancedScoring!.compactMap { $0 }

            ForEach(scoring.indices, id: \.self) { index in
                MediaEditorFormAdvancedScoresRowView(
                    advancedScores: $advancedScores,
                    name: scoring[index],
                    index: index
                )
            }
        }
    }
}

struct MediaEditorFormAdvancedScoresRowView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var advancedScores: [Double]

    private(set) var name: String
    private(set) var index: Int

    var body: some View {
        let isPoint100 = currentUser.user!.mediaListOptions!.scoreFormat! == .point_100
        let max = Double(isPoint100 ? 100 : 10)
        let step = isPoint100 ? 1 : 0.1
        let score = advancedScores[index]
        let scoreString = isPoint100
            ? "\(Int(score))"
            : String(format: "%.1f", score)

        Stepper("\(name): \(score == 0 ? "None" : scoreString)",
                value: $advancedScores[index],
                in: 0...max,
                step: step
        )

        Slider(value: $advancedScores[index], in: 0...max)
    }
}

struct MediaEditorFormAdvancedScoresView_Previews: PreviewProvider {
    @State static private var scores = [5.0]

    static var previews: some View {
        MediaEditorFormAdvancedScoresView(advancedScores: $scores, media: MediaEditorQuery.Data.Medium(
            id: 1,
            type: .anime,
            chapters: nil,
            episodes: 12,
            mediaListEntry: nil
        ))
    }
}
