//
//  MediaPropertyTrendingView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyTrendingView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let trends = viewModel.media?.trending, trends > 0 {
            // TODO: Navigate to subview
            GroupBox(label: Text("Trends")) {
                Text("\(trends.abbreviated)")
                    .foregroundColor(.accentColor)
            }
        }
    }
}
