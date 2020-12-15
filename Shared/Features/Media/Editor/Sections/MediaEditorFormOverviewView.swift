//
//  MediaEditorFormOverviewView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormOverviewView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var status: MediaListStatus
    @Binding private(set) var score: Double

    let media: MediaEditorQuery.Data.Medium

    var body: some View {
        Picker("Status", selection: $status) {
            ForEach(MediaListStatus.allCases, id: \.rawValue) { status in
                Text(statusName(status: status, type: media.type))
                    .tag(status)
            }
        }

        let scoreFormat = currentUser.user!.mediaListOptions!.scoreFormat!

        switch scoreFormat {
            case .point_100:
                Stepper(score == 0 ? "Score: None" : "Score: \(Int(score))", value: $score, in: 0...100)
                Slider(value: $score, in: 0...100)

            case .point_10Decimal:
                Stepper(score == 0 ? "Score: None" : "Score: \(String(format: "%.1f", score))",
                        value: $score,
                        in: 0...10, step: 0.1
                )

                Slider(value: $score, in: 0...10)

            case .point_10:
                Stepper(score == 0 ? "Score: None" : "Score: \(Int(score))", value: $score, in: 0...10)
                Slider(value: $score, in: 0...10)

            case .point_5:
                Picker("Score", selection: $score) {
                    ForEach(1..<6) { starIndex in
                        // It would be nice to give the stars a yellow foreground color, but the segmented
                        // picker style seems to not like it.
                        Image(systemName: "star")
                            .tag(Double(starIndex))
                    }
                }.pickerStyle(SegmentedPickerStyle())

            case .point_3:
                Picker("Score", selection: $score) {
                    // TODO: Add average :| and sad :( images.
                    Text(":(").tag(1.0)
                    Text(":|").tag(2.0)
                    Image(systemName: "face.smiling").tag(3.0)
                }.pickerStyle(SegmentedPickerStyle())

            case .__unknown(_):
                EmptyView()
        }
    }

    func statusName(status: MediaListStatus, type: MediaType?) -> String {
        switch status {
            case .planning: return "Planning"
            case .completed: return "Completed"
            case .dropped: return "Dropped"
            case .paused: return "Paused"
            case .current:
                if let type = type {
                    switch type {
                        case .anime: return "Watching"
                        case .manga: return "Reading"
                        case .__unknown: return "Current"
                    }
                }

                return "Current"
            case .repeating:
                if let type = type {
                    switch type {
                        case .anime: return "Rewatching"
                        case .manga: return "Rereading"
                        case .__unknown: return "Repeating"
                    }
                }

                return "Repeating"
            case .__unknown(let name): return name.capitalized
        }
    }
}

struct MediaEditorFormOverviewView_Previews: PreviewProvider {
    @State static private var status: MediaListStatus = .current
    @State static private var score = 8.0

    static var previews: some View {
        MediaEditorFormOverviewView(status: $status, score: $score, media: MediaEditorQuery.Data.Medium(
            id: 1,
            type: .anime,
            chapters: nil,
            episodes: 12,
            mediaListEntry: nil
        ))
    }
}
