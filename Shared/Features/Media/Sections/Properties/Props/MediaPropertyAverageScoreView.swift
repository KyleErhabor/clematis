//
//  MediaPropertyAverageScoreView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyAverageScoreView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let score = viewModel.media?.averageScore {
            MediaPropertyView("Average Score") {
                Text("\(score)%")
            }
        }
    }
}

struct MediaPropertyAverageScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyAverageScoreView()
    }
}
