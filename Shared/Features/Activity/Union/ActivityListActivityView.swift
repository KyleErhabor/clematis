//
//  ActivityListActivityView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import SwiftUI

struct ActivityListActivityView: View {
    private let activity: ActivityFeedQuery.Data.Page.Activity.AsListActivity

    var body: some View {
        HStack {
            Text("Image")

            VStack {
                Text("Title")
                Text("Description")
            }
        }
    }

    init(activity: ActivityFeedQuery.Data.Page.Activity.AsListActivity) {
        self.activity = activity
    }
}
