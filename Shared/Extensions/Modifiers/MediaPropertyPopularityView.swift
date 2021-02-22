//
//  MediaPropertyPopularityView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyPopularityView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let popularity = viewModel.media?.popularity, popularity > 0 {
            GroupBox(label: Text("Popularity")) {
                Text("\(popularity.abbreviated)")
            }
        }
    }
}
