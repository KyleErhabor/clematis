//
//  MediaExternalLinksView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/3/21.
//

import SwiftUI

struct MediaExternalLinksView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let media = viewModel.media {
            if let idMal = media.idMal,
               let url = URL(string: "https://myanimelist.net/\(media.type == .anime ? "anime" : "manga")/\(idMal)") {
                MediaExternalLinksButtonView(text: "MyAnimeList", url: url, backgroundColor: .blue)
            }
        }
    }
}

fileprivate struct MediaExternalLinksButtonView: View {
    private(set) var text: String
    private(set) var url: URL
    private(set) var backgroundColor: Color

    var body: some View {
        Link(destination: url) {
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}

struct MediaExternalLinksView_Previews: PreviewProvider {
    static var previews: some View {
        MediaExternalLinksView()
    }
}
