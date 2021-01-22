//
//  MediaPropertyFormatView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyFormatView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let format = viewModel.media?.format {
            MediaPropertyView("Format") {
                Text("\(AniList.formatString(format: format))")
            }
        }
    }
}

struct MediaPropertyFormatView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyFormatView()
    }
}
