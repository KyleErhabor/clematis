//
//  MediaPropertySeasonView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertySeasonView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let season = viewModel.media?.season {
            MediaPropertyView("Season") {
                if let year = viewModel.media?.seasonYear {
                    Text("\(season.rawValue.capitalized) \(String(year))")
                } else {
                    Text(season.rawValue.capitalized)
                }
            }
        }
    }
}

struct MediaPropertySeasonView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertySeasonView()
    }
}
