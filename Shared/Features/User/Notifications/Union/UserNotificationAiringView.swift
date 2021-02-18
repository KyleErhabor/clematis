//
//  UserNotificationAiringView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserNotificationAiringView: View {
    private(set) var notification: UserNotificationsQuery.Data.Page.Notification.AsAiringNotification

    var body: some View {
        HStack(alignment: .top) {
            if let media = notification.media {
                NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                    WebImage(url: URL(string: media.coverImage?.extraLarge ?? ""))
                        .resizable()
                        .placeholder {
                            if let hex = media.coverImage?.color,
                               let color = Int("\(hex)", radix: 16) {
                                Color(hex: color)
                            } else {
                                Color.accentColor
                            }
                        }.scaledToFill()
                        .frame(width: 80)
                        .clipped()
                        .cornerRadius(4)
                }.animation(.default)

                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                            Text("\(media.title?.userPreferred ?? "?")")
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

                    Text("Episode ")
                        + Text("\(notification.episode)").bold()
                        + Text(" aired")
                }
            }
        }.frame(height: 120)
    }
}

struct UserNotificationAiringView_Previews: PreviewProvider {
    static var previews: some View {
        UserNotificationAiringView(notification: .init(
            id: -1,
            episode: 3,
            createdAt: Int(Date().timeIntervalSince1970),
            media: .init(id: 124845, title: .init(userPreferred: "Wonder Egg Priority"))
        ))
    }
}
