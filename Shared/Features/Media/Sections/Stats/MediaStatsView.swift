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
        if viewModel.media?.rankings?.isEmpty == false {
            // TODO: Add scores distribution (bar graph) and status distribution (pie graph)
            Text("Stats")
                .font(.title)
                .bold()

            MediaStatsRankingView()
            
            Divider()
        }
    }
}

struct MediaStatsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatsView()
    }
}
