//
//  MediaSummaryPropertyIDView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyIDView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        #if DEBUG
        MediaSummaryPropertyView(title: "ID", content: "\(viewModel.id)")

        #endif
    }
}
struct MediaSummaryPropertyIDView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyIDView()
    }
}
