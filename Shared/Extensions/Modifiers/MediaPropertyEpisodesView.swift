//
//  MediaPropertyEpisodesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyEpisodesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let episodes = viewModel.media?.episodes {
            GroupBox(label: Text("Episodes")) {
                Text("\(episodes)")
            }
        }
    }
}
