//
//  MediaEditorProgressMangaView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorProgressMangaView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @Binding var progress: Double

    var body: some View {
        let title = progress == 0
            ? "Chapters"
            : "Chapters: \(Int(progress))"

        if let chapters = viewModel.media?.chapters {
            Stepper("\(title)", value: $progress, in: 0...Double(chapters))

            Slider(value: $progress, in: 0...Double(chapters))
        } else {
            Stepper("\(title)", value: $progress, in: 0...Double.greatestFiniteMagnitude)
        }
    }
}
