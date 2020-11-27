//
//  ActivityFeedView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import SwiftUI

struct ActivityFeedView: View {
    @StateObject var viewModel = ActivityFeedViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.activities) { activity in
                    // Wrapping everything in a ScrollView allows for certain views in the row content to be
                    // navigatable, while ignoring the non-navigatable elements.
                    ScrollView {
                        // The activity selection logic has been moved to its own view, because Swift had problems
                        // type-checking the expression in reasonable time. My god, please fix this.
                        ActivityFeedSelectionView(activity: activity)
                    }
                }
            }.navigationTitle("Activity Feed")
        }.onAppear {
            viewModel.fetchActivities()
        }
    }
}

fileprivate struct ActivityFeedSelectionView: View {
    let activity: ActivityFeedQuery.Data.Page.Activity

    var body: some View {
        if let listActivity = activity.asListActivity {
            ActivityFeedListKindView(activity: listActivity)
        } else if activity.asTextActivity != nil {
            ActivityFeedTextKindView()
        } else if activity.asMessageActivity != nil {
            ActivityFeedMessageKindView()
        }
    }
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedView()
    }
}
