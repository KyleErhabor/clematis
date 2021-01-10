//
//  MediaMetadataView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/3/21.
//

import SwiftUI

struct MediaMetadataView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        List {
            if let format = viewModel.media?.format {
                MediaMetadataPairView(title: "Format", content: formatName(format: format))
            }

            if let english = viewModel.media?.title?.english {
                MediaMetadataPairView(title: "English", content: english)
            }

            if let romaji = viewModel.media?.title?.romaji {
                MediaMetadataPairView(title: "Romaji", content: romaji)
            }

            if let native = viewModel.media?.title?.native {
                MediaMetadataPairView(title: "Native", content: native)
            }

            if let synonyms = viewModel.media?.synonyms?.compactMap({ $0 }) {
                MediaMetadataPairView(title: "Synonyms", content: synonyms.joined(separator: ", "))
            }
        }
    }

    func formatName(format: MediaFormat) -> String {
        switch format {
            case .tv: return "TV"
            case .tvShort: return "TV Short"
            case .movie: return "Movie"
            case .special: return "Special"
            case .ova: return "OVA"
            case .ona: return "ONA"
            case .music: return "Music"
            case .manga: return "Manga"
            case .novel: return "Novel" // Consider Light Novel
            case .oneShot: return "One Shot"
            case let .__unknown(fmt): return fmt.capitalized
        }
    }
}

fileprivate struct MediaMetadataPairView: View {
    private(set) var title: String
    private(set) var content: String

    var body: some View {
        HStack {
            Text(title).foregroundColor(.secondary)

            Spacer()

            Text(content)
        }
    }
}

struct MediaMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        MediaMetadataView()
    }
}
