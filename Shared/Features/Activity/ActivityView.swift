//
//  ActivityView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import SwiftUI

struct ActivityView: View {
    @StateObject var viewModel = ActivityViewModel()
    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            List(viewModel.activities) { activity in
                // This evaluation has been moved to its own view to prevent the following error: "The compiler is
                // unable to type-check this expression in reasonable time; try breaking up the expression into
                // distinct sub-expressions".
                //
                // In the future, it would be preferred to move the activity selection back to parent view.
                ActivitySelectorView(activity: activity, selection: $selection)
            }.navigationTitle("Activity Feed")
        }.onAppear {
            viewModel.fetchActivities()
        }
    }
}

fileprivate struct ActivitySelectorView: View {
    let activity: ActivityFeedQuery.Data.Page.Activity
    @Binding var selection: String?

    var body: some View {
        if let listActivity = activity.asListActivity {
            ActivityListActivityView(activity: listActivity, selection: $selection)
        } else if activity.asTextActivity != nil {
            ActivityTextActivityView()
        } else if activity.asMessageActivity != nil {
            ActivityMessageActivityView()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
