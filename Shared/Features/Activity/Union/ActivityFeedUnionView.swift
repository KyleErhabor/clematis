//
//  ActivityFeedUnionView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/7/21.
//

import SwiftUI

struct ActivityFeedUnionView: View {
    private let activity: ActivityFeedQuery.Data.Page.Activity

    var body: some View {
        if let list = activity.asListActivity?.fragments.listActivityFragment {
            ActivityListView(viewModel: .init(activity: list))
        } else if let text = activity.asTextActivity?.fragments.textActivityFragment {
            ActivityTextView(viewModel: .init(activity: text))
        }
    }

    init(activity: ActivityFeedQuery.Data.Page.Activity) {
        self.activity = activity
    }
}

struct ActivityFeedUnionView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedUnionView(activity: .makeMessageActivity())
    }
}
