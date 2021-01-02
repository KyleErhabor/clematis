//
//  MediaView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaView: View {
    @StateObject var viewModel: MediaViewModel

    var body: some View {
        ScrollView {
            MediaHeaderView()
            MediaSummaryView()
        }.navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea([.top, .horizontal])
        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}
