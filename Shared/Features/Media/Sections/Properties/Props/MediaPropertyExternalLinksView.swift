//
//  MediaPropertyExternalLinksView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyExternalLinksView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        let total = totalLinks()

        if total != 0 {
            MediaPropertyView("External Links") {
                Text("\(total)")
            } expanded: {
                VStack {
                    MediaPropertyTwitterLinkView()
                    MediaPropertyTrailerLinkView()

                    ForEach(viewModel.media?.externalLinks?.compactMap({ $0 }) ?? [], id: \.id) { link in
                        if let url = URL(string: link.url) {
                            MediaPropertyView(link.site) {
                                Link("Go", destination: url)
                            }
                        }
                    }
                }
            }
        }
    }

    func totalLinks() -> Int {
        var total = 0

        if let hashtags = viewModel.media?.hashtag?.split(separator: " ") {
            total += hashtags.count
        }

        if let trailer = viewModel.media?.trailer,
           trailer.id != nil && trailer.site != nil {
            total += 1
        }

        if let links = viewModel.media?.externalLinks?.compactMap({ $0 }) {
            total += links.count
        }

        return total
    }
}

struct MediaPropertyExternalLinksView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyExternalLinksView()
    }
}
