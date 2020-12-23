//
//  ActivityFeedView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/5/20.
//

import Combine
import SwiftUI

struct ActivityFeedView: View {
    @StateObject var viewModel = ActivityFeedViewModel()

    var body: some View {
        List(viewModel.activities) { activity in
            // In order to make certain views in the list cell navigatable (`NavigationView(...) {...}`), we're
            // wrapping our main view in a `ScrollView`.
            ScrollView {
                // NOTE: "The compiler is unable to type-check this expression in reasonable time; try breaking up
                // the expression into distinct sub-expressions"
                // Do not remove this sub-view until this issue has been resolved.
                ActivityFeedSelectorView(activity: activity)
                    .padding(8)
            }
        }.currentUser()
        .navigationTitle("Activity Feed")
        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchActivities()
        }
    }
}

struct ActivityFeedSelectorView: View {
    private let activity: ActivityFeedQuery.Data.Page.Activity

    var body: some View {
        if let listActivity = activity.asListActivity?.fragments.listActivityFragment {
//            ActivityListKindView(activity: listActivity)
        } else if let textActivity = activity.asTextActivity?.fragments.textActivityFragment {
            ActivityTextKindView(activity: textActivity)
        }
    }

    init(activity: ActivityFeedQuery.Data.Page.Activity) {
        self.activity = activity
    }
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedView()
    }
}
