//
//  MediaSummaryPropertyAiringView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyAiringView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        if let airing = viewModel.media?.nextAiringEpisode,
           let timeRemaining = formatter.string(from: TimeInterval(airing.timeUntilAiring)) {
            // TODO: Click to scroll to episodes
            MediaSummaryPropertyView(
                title: "Airing",
                content: "Ep. \(airing.episode): \(timeRemaining)",
                important: true
            )
        }
    }
}

struct MediaSummaryPropertyAiringView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyAiringView()
    }
}
