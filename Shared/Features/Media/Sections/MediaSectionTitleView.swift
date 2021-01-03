//
//  MediaSectionTitleView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/3/21.
//

import SwiftUI

struct MediaSectionTitleView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        HStack {
            if let media = viewModel.media {
                if let english = media.title?.english {
                    GroupBox(label: Text("English")) {
                        Text(english)
                    }
                }

                if let romaji = media.title?.romaji {
                    GroupBox(label: Text("Romaji")) {
                        Text(romaji)
                    }
                }

                if let native = media.title?.native {
                    GroupBox(label: Text("Native")) {
                        Text(native)
                    }
                }
            }
        }

        if let synonyms = viewModel.media?.synonyms?.compactMap({ $0 }) {
            GroupBox(label: Text("Synonyms")) {
                List(synonyms, id: \.self) { title in
                    Text(title)
                }.listStyle(InsetGroupedListStyle())
            }
        }
    }
}

struct MediaSectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSectionTitleView()
    }
}
