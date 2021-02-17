//
//  ActivityFeedView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

/// A view for displaying the activity feed.
struct ActivityFeedView: View {
    /// The view model for the activity feed.
    @StateObject private var viewModel = ActivityFeedViewModel()

    /// A state for if the feed's filter sheet should be presented.
    @State private var isPresenting = false

    var body: some View {
        // FIXME: https://github.com/LiteLT/clematis-apple/issues/5
        List {
            ForEach(viewModel.activities, id: \.id) { activity in
                ScrollView {
                    ActivityFeedUnionView(activity: activity)
                        .padding(8)
                }
            }

            if viewModel.pageInfo?.hasNextPage == true {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .onAppear {
                        viewModel.next()
                    }
            }
        }.navigationTitle("Activity Feed")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            }
        }.sheet(isPresented: $isPresenting) {
            // The activity list should be reloaded in case any filter options have been changed. Dismissing the
            // presentation does not call `.onAppear(perform:)`.
            viewModel.load()
        } content: {
            ActivityFeedFilterView()
                .environmentObject(viewModel)
        }.onAppear {
            viewModel.load()
        }
    }
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedView()
    }
}
