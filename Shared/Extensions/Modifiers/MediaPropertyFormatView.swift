//
//  MediaPropertyFormatView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyFormatView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let format = viewModel.media?.format {
            GroupBox(label: Text("Format")) {
                if viewModel.media?.isLicensed == false {
                    Text("\(AniList.formatString(format: format)) (Doujinshi)")
                } else {
                    Text("\(AniList.formatString(format: format))")
                }
            }
        }
    }
}
