//
//  MediaPropertySeasonView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertySeasonView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let season = viewModel.media?.season {
            GroupBox(label: Text("Season")) {
                if let year = viewModel.media?.seasonYear {
                    Text("\(season.rawValue.capitalized) \(String(year))")
                } else {
                    Text("\(season.rawValue.capitalized)")
                }
            }
        }
    }
}
