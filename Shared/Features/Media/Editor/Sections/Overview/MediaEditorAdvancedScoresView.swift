//
//  MediaEditorAdvancedScoresView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorAdvancedScoresView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var userStore: CurrentUserStore

    var body: some View {
        if let scoreFormat = userStore.users.first?.mediaListOptions?.scoreFormat,
           case var .dictionary(advancedScores) = viewModel.media?.mediaListEntry?.advancedScores {
            let names = advancedScoreNames()

            ForEach(names, id: \.self) { name in
                let binding = Binding {
                    (advancedScores[name] as? Double) ?? 0
                } set: { score in
                    advancedScores[name] = score

                    if viewModel.media?.mediaListEntry == nil {
                        viewModel.media?.mediaListEntry = .init(
                            id: viewModel.id,
                            advancedScores: .dictionary(advancedScores)
                        )
                    } else {
                        viewModel.media?.mediaListEntry?.advancedScores = .dictionary(advancedScores)
                    }

                    reaction(score: score)
                }

                // `advancedScoresEnabled` does not account for the user's score format. A user can have it enabled
                // even if they're using the 5-star format, which is wrong.
                switch scoreFormat {
                    case .point_100:
                        MediaEditorAdvancedScores100View(score: binding, name: name)
                    case .point_10Decimal:
                        MediaEditorAdvancedScores10DecimalView(score: binding, name: name)
                    default:
                        EmptyView()
                }
            }
        }
    }

    func advancedScoreNames() -> [String] {
        guard let type = viewModel.media?.type else {
            return []
        }

        switch type {
            case .anime:
                return userStore.users.first?.mediaListOptions?.animeList?.advancedScoring?.compactMap { $0 } ?? []
            case .manga:
                return userStore.users.first?.mediaListOptions?.mangaList?.advancedScoring?.compactMap { $0 } ?? []
            case .__unknown:
                return []
        }
    }

    func reaction(score: Double) {
        if case let .dictionary(advancedScores) = viewModel.media?.mediaListEntry?.advancedScores {
            let scores = advancedScores.values.compactMap { value -> Double? in
                if let value = value as? Double, value != 0 {
                    return value
                }

                return nil
            }

            if scores.isEmpty {
                viewModel.media?.mediaListEntry?.score = scores.reduce(0, +) / Double(scores.count)
            }
        }
    }
}

struct MediaEditorAdvancedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorAdvancedScoresView()
    }
}
