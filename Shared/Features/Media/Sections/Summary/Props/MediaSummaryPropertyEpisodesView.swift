//
//  MediaSummaryPropertyEpisodesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyEpisodesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let episodes = viewModel.media?.episodes, episodes > 0 {
            if let duration = viewModel.media?.duration {
                MediaSummaryPropertyView(title: "Episodes", content: "\(episodes) (\(duration) min.)")
            } else {
                MediaSummaryPropertyView(title: "Episodes", content: "\(episodes)")
            }
        }
    }
}

struct MediaSummaryPropertyEpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyEpisodesView()
    }
}
