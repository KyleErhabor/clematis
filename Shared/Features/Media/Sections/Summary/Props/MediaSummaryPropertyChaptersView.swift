//
//  MediaSummaryPropertyChaptersView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyChaptersView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let chapters = viewModel.media?.chapters, chapters > 0 {
            MediaSummaryPropertyView(title: "Chapters", content: "\(chapters)")
        }
    }
}

struct MediaSummaryPropertyChaptersView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyChaptersView()
    }
}
