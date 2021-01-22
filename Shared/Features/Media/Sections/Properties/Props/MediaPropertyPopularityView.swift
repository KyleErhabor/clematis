//
//  MediaPropertyPopularityView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyPopularityView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let popularity = viewModel.media?.popularity {
            MediaPropertyView("Popularity") {
                Text("\(popularity)")
            }
        }
    }
}

struct MediaPropertyPopularityView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyPopularityView()
    }
}
