//
//  MediaPropertyTwitterLinkView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyTwitterLinkView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let hashtags = viewModel.media?.hashtag?.split(separator: " "), !hashtags.isEmpty {
            if hashtags.count == 1 {
                MediaPropertyTwitterLinkRowView(hashtag: String(hashtags[0]), isSingular: true)
            } else {
                MediaPropertyView("Twitter Hashtags") {
                    Text("\(hashtags.count)")
                } expanded: {
                    VStack {
                        ForEach(hashtags, id: \.self) { hashtag in
                            MediaPropertyTwitterLinkRowView(hashtag: String(hashtag), isSingular: false)
                        }
                    }
                }
            }
        }
    }
}

struct MediaPropertyTwitterLinkRowView: View {
    private(set) var hashtag: String
    private(set) var isSingular: Bool

    var body: some View {
        if let encoded = hashtag.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://twitter.com/search?q=\(encoded)") {
            MediaPropertyView(isSingular ? "Twitter Hashtag" : hashtag) {
                Link(isSingular ? hashtag : "Go", destination: url)
            }
        }
    }
}

struct MediaPropertyTwitterLinkView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyTwitterLinkView()
    }
}
