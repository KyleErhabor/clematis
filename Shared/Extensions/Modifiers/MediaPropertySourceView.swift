//
//  MediaPropertySourceView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertySourceView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let source = viewModel.media?.source {
            GroupBox(label: Text("Source")) {
                Text("\(AniList.sourceString(source: source))")
            }
        }
    }
}
