//
//  MediaSummaryPropertySourceView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertySourceView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let source = viewModel.media?.source {
            MediaSummaryPropertyView(title: "Source", content: AniList.sourceString(source: source))
        }
    }
}

struct MediaSummaryPropertySourceView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertySourceView()
    }
}
