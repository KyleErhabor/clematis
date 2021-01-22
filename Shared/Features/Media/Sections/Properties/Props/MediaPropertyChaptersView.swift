//
//  MediaPropertyChaptersView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyChaptersView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let chapters = viewModel.media?.chapters {
            MediaPropertyView("Chapters") {
                Text("\(chapters)")
            }
        }
    }
}

struct MediaPropertyChaptersView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyChaptersView()
    }
}
