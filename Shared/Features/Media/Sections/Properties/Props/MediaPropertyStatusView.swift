//
//  MediaPropertyStatusView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyStatusView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let status = viewModel.media?.status,
           let type = viewModel.media?.type {
            MediaPropertyView("Status") {
                Text(AniList.statusString(status: status, type: type))
            }
        }
    }
}

struct MediaPropertyStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyStatusView()
    }
}
