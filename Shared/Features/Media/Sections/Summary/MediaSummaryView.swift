//
//  MediaSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/10/21.
//

import SwiftUI

struct MediaSummaryView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaViewModel
    @Binding private(set) var isPresenting: Bool

    var body: some View {
        MediaSummaryHeaderView(isPresenting: $isPresenting).padding()
        Divider()

        MediaSummaryPropertiesView()
        Divider()

        Text(viewModel.media?.description ?? "").padding()
    }
}

struct MediaSummaryView_Previews: PreviewProvider {
    @State static private var isPresenting = false

    static var previews: some View {
        MediaSummaryView(isPresenting: $isPresenting)
    }
}
