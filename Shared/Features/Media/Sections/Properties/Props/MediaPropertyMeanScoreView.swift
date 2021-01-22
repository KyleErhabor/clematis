//
//  MediaPropertyMeanScoreView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyMeanScoreView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let score = viewModel.media?.meanScore {
            MediaPropertyView("Mean Score") {
                Text("\(score)%")
            }
        }
    }
}

struct MediaPropertyMeanScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyMeanScoreView()
    }
}
