//
//  UserNotificationListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

import SwiftUI

struct UserNotificationListView: View {
    @StateObject private var viewModel = UserNotificationListViewModel()

    var body: some View {
        List(viewModel.notifications, id: \.id) { notification in
            ScrollView {
                // The max width and height is 120. The view is not set here because some views may benefit off having
                // a custom width and height (user vs. media).
                UserNotificationSelectionView(notification: notification)
            }
        }.navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.load()
        }
    }
}

struct UserNotificationSelectionView: View {
    private(set) var notification: UserNotificationsQuery.Data.Page.Notification

    var body: some View {
        if let airing = notification.asAiringNotification {
            UserNotificationAiringView(notification: airing)
        } else if let following = notification.asFollowingNotification {
            UserNotificationFollowingView(notification: following)
        } else if let activityMessage = notification.asActivityMessageNotification {
            UserNotificationActivityMessageView(notification: activityMessage)
        } else if let activityMention = notification.asActivityMentionNotification {
            UserNotificationActivityMentionView(notification: activityMention)
        }
    }
}

struct UserNotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        UserNotificationListView()
    }
}
