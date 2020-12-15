//
//  MediaEditorFormProgressView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormProgressView: View {
    @Binding private(set) var repeats: Int
    @Binding private(set) var progress: Int
    @Binding private(set) var volumes: Int
    @Binding private(set) var status: MediaListStatus

    let media: MediaEditorQuery.Data.Medium

    var body: some View {
        Stepper("Repeats: \(repeats)", value: $repeats, in: 0...Int.max)

        if media.type == .anime {
            Stepper(media.episodes == nil ? "Episodes: \(progress)" : "Episodes: \(progress)/\(media.episodes!)",
                    value: $progress,
                    in: 0...(media.episodes ?? Int.max)
            ).onChange(of: progress) { num in
                if progress == media.episodes {
                    status = .completed
                } else {
                    status = .current
                }
            }
        } else if media.type == .manga {
            Stepper(media.chapters == nil ? "Chapters: \(progress)" : "Chapters: \(progress)/\(media.chapters!)",
                    value: $progress,
                    in: 0...(media.chapters ?? Int.max))

            Stepper(media.volumes == nil ? "Volumes: \(volumes)" : "Voles: \(volumes)/\(media.volumes!)",
                    value: $volumes,
                    in: 0...(media.volumes ?? Int.max))
        }
    }
}

struct MediaEditorFormProgressView_Previews: PreviewProvider {
    @State static private var repeats = 1
    @State static private var episodes = 12
    @State static private var volumes = 3
    @State static private var status: MediaListStatus = .current

    static var previews: some View {
        MediaEditorFormProgressView(
            repeats: $repeats,
            progress: $episodes,
            volumes: $volumes,
            status: $status,
            media: MediaEditorQuery.Data.Medium(
                id: 1,
                type: .anime,
                chapters: nil,
                episodes: 12,
                mediaListEntry: nil
            )
        )
    }
}
