//
//  MediaStatsView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/19/21.
//

import SwiftUI

struct MediaStatsView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        Text("Stats")
            .font(.title)
            .bold()

        if viewModel.media?.rankings?.isEmpty == false {
            MediaStatsRankingView()
        }

        MediaStatsDistributionView()
    }
}

struct MediaStatsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatsView()
    }
}
