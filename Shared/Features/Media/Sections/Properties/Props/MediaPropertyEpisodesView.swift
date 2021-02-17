//
//  MediaPropertyEpisodesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyEpisodesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let episodes = viewModel.media?.episodes {
            MediaPropertyView("Episodes") {
                Text("\(episodes)")
            }
        }
    }
}

struct MediaPropertyEpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyEpisodesView()
    }
}
