//
//  UserNotificationActivityMessageView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserNotificationActivityMessageView: View {
    @Environment(\.colorScheme) private var colorScheme
    private(set) var notification: UserNotificationsQuery.Data.Page.Notification.AsActivityMessageNotification

    var body: some View {
        // NOTE: There's a `message` field in this kind of notification, but it always returns `null`. If it didn't,
        // it would be convenient to display the message in this view.
        HStack(alignment: .top) {
            if let user = notification.user {
                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    WebImage(url: URL(string: user.avatar?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 80, alignment: .top)
                        .clipped()
                        .cornerRadius(4)
                }.animation(.default)

                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                            Text("\(user.name)")
                                .font(.headline)
                        }.buttonStyle(PlainButtonStyle())

                        Spacer()

                        if let createdAt = notification.createdAt {
                            let date = Date(timeIntervalSince1970: TimeInterval(createdAt))

                            Text(date, formatter: RelativeDateTimeFormatter())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Text("Sent you a message")
                }
            }
        }.frame(height: 80)
    }
}

struct UserNotificationActivityMessageView_Previews: PreviewProvider {
    static var previews: some View {
        UserNotificationActivityMessageView(notification: .init(
            id: -1,
            createdAt: Int(Date().timeIntervalSince1970),
            user: .init(
                id: 404366,
                name: "vixxz"
            )
        ))
    }
}
