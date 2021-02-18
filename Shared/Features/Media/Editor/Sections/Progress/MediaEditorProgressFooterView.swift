//
//  MediaEditorProgressFooterView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorProgressFooterView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if let episodes = viewModel.media?.episodes {
                Text("There are ")
                    + Text("\(episodes)").bold()
                    + Text(" episodes in this anime.")
            }

            if let chapters = viewModel.media?.chapters {
                Text("There are ")
                    + Text("\(chapters)").bold()
                    + Text(" chapters in this manga.")
            }

            if let volumes = viewModel.media?.volumes {
                Text("There are ")
                    + Text("\(volumes)").bold()
                    + Text(" volumes in this manga.")
            }
        }
    }
}
