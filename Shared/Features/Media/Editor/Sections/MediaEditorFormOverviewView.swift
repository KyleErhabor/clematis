//
//  MediaEditorFormOverviewView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormOverviewView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let statusBinding = Binding {
            viewModel.media!.mediaListEntry?.status ?? .planning
        } set: { status in
            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, status: status)
            } else {
                viewModel.media!.mediaListEntry!.status = status
            }

            switch status {
                case .current:
                    if (viewModel.media!.mediaListEntry!.progress ?? 0) == 0
                        && (viewModel.media!.mediaListEntry!.repeat ?? 0) == 0 {
                        let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())

                        viewModel.media!.mediaListEntry!.startedAt = .init(
                            year: components.year,
                            month: components.month,
                            day: components.day
                        )
                    }
                case .completed:
                    if viewModel.media!.type == .anime {
                        viewModel.media!.mediaListEntry!.progress = viewModel.media!.episodes
                    } else {
                        viewModel.media!.mediaListEntry!.progress = viewModel.media!.chapters
                        viewModel.media!.mediaListEntry!.progressVolumes = viewModel.media!.volumes
                    }

                    let progress = (viewModel.media!.type == .anime
                                        ? viewModel.media!.episodes
                                        : viewModel.media!.chapters) ?? -1

                    if viewModel.media!.mediaListEntry!.progress == progress
                        && (viewModel.media!.mediaListEntry!.repeat ?? 0) == 0 {
                        let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())

                        viewModel.media!.mediaListEntry!.completedAt = .init(
                            year: components.year,
                            month: components.month,
                            day: components.day
                        )
                    }
                default: break
            }
        }

        Picker("Status", selection: statusBinding) {
            ForEach(MediaListStatus.allCases, id: \.rawValue) { status in
                Text(AniList.statusName(status: status, type: viewModel.media!.type!))
                    .tag(status)
            }
        }

        let scoreFormat = currentUser.users[0].mediaListOptions!.scoreFormat!
        let scoreBinding = Binding {
            Double(viewModel.media!.mediaListEntry?.score ?? 0)
        } set: { score in
            let score = scoreFormat == .point_10Decimal ? round(score * 10) / 10 : floor(score)

            if viewModel.media!.mediaListEntry == nil {
                viewModel.media!.mediaListEntry = .init(id: -1, score: score)
            } else {
                viewModel.media!.mediaListEntry!.score = score
            }
        }

        switch scoreFormat {
            case .point_10:
                MediaEditorFormOverviewIncrementalView(score: scoreBinding, max: 10, step: 1, isFloat: false)
            case .point_100:
                MediaEditorFormOverviewIncrementalView(score: scoreBinding, max: 100, step: 1, isFloat: false)
            case .point_10Decimal:
                MediaEditorFormOverviewIncrementalView(score: scoreBinding, max: 10, step: 0.1, isFloat: true)
            case .point_5: // Star ratings (1 - 5).
                Picker("Score", selection: scoreBinding) {
                    ForEach(1..<6) { starIndex in
                        Image(systemName: "star")
                            .tag(Double(starIndex))
                    }
                }.pickerStyle(SegmentedPickerStyle())
            case .point_3: // Smiley faces :)
                Picker("Score", selection: scoreBinding) {
                    // Replace these with custom images (modified version of SF symbol face.smiling)
                    Text(":(").tag(1.0)
                    Text(":|").tag(2.0)
                    Image(systemName: "face.smiling").tag(3.0)
                }.pickerStyle(SegmentedPickerStyle())
            case .__unknown:
                EmptyView()
        }
    }
}

fileprivate struct MediaEditorFormOverviewIncrementalView: View {
    @Binding private(set) var score: Double
    
    private(set) var max: Double
    private(set) var step: Double
    private(set) var isFloat: Bool

    var body: some View {
        Stepper(score == 0 ? "Score: None" : "Score: \(isFloat ? String(format: "%.1f", score) : String(Int(score)))",
                value: $score,
                in: 0...max,
                step: step
        )
        Slider(value: $score, in: 0...max)
    }
}
