//
//  MediaPropertyChaptersView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyChaptersView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let chapters = viewModel.media?.chapters {
            GroupBox(label: Text("Chapters")) {
                Text("\(chapters)")
            }
        }
    }
}
