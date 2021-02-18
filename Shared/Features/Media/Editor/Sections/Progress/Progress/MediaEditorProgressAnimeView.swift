//
//  MediaEditorProgressAnimeView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorProgressAnimeView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @Binding var progress: Double

    var body: some View {
        let title = progress == 0
            ? "Episodes"
            : "Episodes: \(Int(progress))"

        if let episodes = viewModel.media?.episodes {
            VStack {
                Stepper("\(title)", value: $progress, in: 0...Double(episodes))
                Slider(value: $progress, in: 0...Double(episodes))
            }
        } else {
            Stepper("\(title)", value: $progress, in: 0...Double.greatestFiniteMagnitude)
        }
    }
}
