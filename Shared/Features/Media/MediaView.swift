//
//  MediaView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaView: View {
    @StateObject var viewModel: MediaViewModel

    var body: some View {
        ScrollView {
            MediaBannerView()

            VStack {
                MediaOverviewView()
                    .padding(.horizontal)

                MediaPropertiesView()
                    .padding(.vertical)
            }.offset(y: -120)
        }.navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                MediaToolbarView()
            }
        }.alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Error"),
                message: Text("\(error.message ?? "")"),
                dismissButton: .default(Text("OK"))
            )
        }.environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(viewModel: MediaViewModel(id: 1491))
    }
}
