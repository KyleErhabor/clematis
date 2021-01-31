//
//  UserNotificationFollowingView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserNotificationFollowingView: View {
    private(set) var notification: UserNotificationsQuery.Data.Page.Notification.AsFollowingNotification

    var body: some View {
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

                    Text("Started following you")
                }
            }
        }.frame(height: 80)
    }
}

struct UserNotificationFollowingView_Previews: PreviewProvider {
    static var previews: some View {
        UserNotificationFollowingView(notification: .init(
            id: -1,
            createdAt: Int(Date().timeIntervalSince1970),
            user: .init(id: 305093, name: "Xelith")
        ))
    }
}
