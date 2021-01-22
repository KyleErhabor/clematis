//
//  MediaPropertySourceView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertySourceView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let source = viewModel.media?.source {
            MediaPropertyView("Source") {
                Text(AniList.sourceString(source: source))
            }
        }
    }
}

struct MediaPropertySourceView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertySourceView()
    }
}
