//
//  MediaSummaryPropertySeasonView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertySeasonView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let season = viewModel.media?.season {
            if let year = viewModel.media?.seasonYear {
                MediaSummaryPropertyView(title: "Season", content: "\(season.rawValue.capitalized) \(year)")
            } else {
                MediaSummaryPropertyView(title: "Season", content: season.rawValue.capitalized)
            }
        }
    }
}

struct MediaSummaryPropertySeasonView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertySeasonView()
    }
}
