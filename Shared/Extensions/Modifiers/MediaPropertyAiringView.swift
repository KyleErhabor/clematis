//
//  MediaPropertyAiringView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyAiringView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.maximumUnitCount = 3
        formatter.unitsStyle = .short

        return formatter
    }()

    var body: some View {
        if let airing = viewModel.media?.nextAiringEpisode,
           let time = formatter.string(from: TimeInterval(airing.timeUntilAiring)) {
            // TODO: Navigate to subview
            GroupBox(label: Text("Airing")) {
                Text("Ep. \(airing.episode): \(time)")
                    .foregroundColor(.accentColor)
            }
        }
    }
}
