//
//  MediaSummaryPropertyVolumesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyVolumesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let volumes = viewModel.media?.volumes, volumes > 0 {
            MediaSummaryPropertyView(title: "Volumes", content: "\(volumes)")
        }
    }
}

struct MediaSummaryPropertyVolumesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyVolumesView()
    }
}
