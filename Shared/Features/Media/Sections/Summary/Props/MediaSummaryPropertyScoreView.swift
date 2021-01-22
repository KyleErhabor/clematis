//
//  MediaSummaryPropertyScoreView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyScoreView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let score = viewModel.media?.averageScore {
            MediaSummaryPropertyView(title: "Score", content: "\(score)%")
        }
    }
}

struct MediaSummaryPropertyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyScoreView()
    }
}
