//
//  MediaSummaryPropertyStatusView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyStatusView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let status = viewModel.media?.status,
           let type = viewModel.media?.type {
            let status = AniList.statusString(status: status, type: type)

            MediaSummaryPropertyView(title: "Status", content: status)
        }
    }
}

struct MediaSummaryPropertyStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyStatusView()
    }
}
