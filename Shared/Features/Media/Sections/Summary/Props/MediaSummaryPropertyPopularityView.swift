//
//  MediaSummaryPropertyPopularityView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyPopularityView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let popularity = viewModel.media?.popularity, popularity > 0 {
            MediaSummaryPropertyView(title: "Popularity", content: popularity.abbreviated)
        }
    }
}

struct MediaSummaryPropertyPopularityView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyPopularityView()
    }
}
